view: dt_siguiente_producto_sugerido {
  derived_table: {
    sql:
      WITH unpivoted AS (
        SELECT CUSTOMER_ID, REPLACE(producto, 'HAS_', '') AS producto
        FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`
        UNPIVOT (
          has_val FOR producto IN (
            HAS_MERCADO_DE_CAPITALES, HAS_PRLV, HAS_WARRANS, HAS_NOTAS_ESTRUCTURADAS,
            HAS_FONDOS_DE_COBERTURA, HAS_FONDO_DE_FONDOS, HAS_MEXDOLAR, HAS_SAVING,
            HAS_EFECTIVO, HAS_RENTA_VARIABLE, HAS_MERCADO_DE_DINERO_REPORTO, HAS_CEDE,
            HAS_MERCADO_DE_DINERO_DIRECTO, HAS_FONDOS_DE_DEUDA, HAS_PAGARE_BURSATIL, HAS_CREDITO
          )
        )
        WHERE has_val = 1
      ),
      totales AS (
        SELECT COUNT(DISTINCT CUSTOMER_ID) AS total_clientes FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`
      ),
      prod_totales AS (
        SELECT producto, COUNT(DISTINCT CUSTOMER_ID) AS clientes_prod
        FROM unpivoted
        GROUP BY 1
      ),
      afinidad AS (
        SELECT 
          p1.producto AS prod_a,
          p2.producto AS prod_b,
          COUNT(DISTINCT p1.CUSTOMER_ID) AS clientes_ambos,
          ROUND(COUNT(DISTINCT p1.CUSTOMER_ID) * 100.0 / t1.clientes_prod, 1) AS confianza_pct,
          ROUND((COUNT(DISTINCT p1.CUSTOMER_ID) * t.total_clientes * 1.0) / (t1.clientes_prod * t2.clientes_prod), 2) AS lift
        FROM unpivoted p1
        JOIN unpivoted p2 ON p1.CUSTOMER_ID = p2.CUSTOMER_ID AND p1.producto != p2.producto
        JOIN prod_totales t1 ON p1.producto = t1.producto
        JOIN prod_totales t2 ON p2.producto = t2.producto
        CROSS JOIN totales t
        GROUP BY 1, 2, t1.clientes_prod, t2.clientes_prod, t.total_clientes
      ),
      catalogo_16 AS (
        SELECT DISTINCT producto FROM prod_totales
      ),
      clientes_todos AS (
        SELECT DISTINCT CUSTOMER_ID FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`
      ),
      candidatos AS (
        SELECT
          c.CUSTOMER_ID,
          cat.producto AS prod_candidato
        FROM clientes_todos c
        CROSS JOIN catalogo_16 cat
        LEFT JOIN unpivoted u
          ON c.CUSTOMER_ID = u.CUSTOMER_ID AND cat.producto = u.producto
        WHERE u.producto IS NULL
      ),
      scores_afinidad AS (
        SELECT
          cand.CUSTOMER_ID,
          cand.prod_candidato,
          af.prod_a AS prod_origen_explicativo,
          af.confianza_pct,
          af.lift,
          ROW_NUMBER() OVER(
            PARTITION BY cand.CUSTOMER_ID, cand.prod_candidato
            ORDER BY af.confianza_pct DESC, af.lift DESC
          ) AS rank_origen
        FROM candidatos cand
        JOIN unpivoted u ON cand.CUSTOMER_ID = u.CUSTOMER_ID
        JOIN afinidad af ON u.producto = af.prod_a AND cand.prod_candidato = af.prod_b
      ),
      best_afinidad AS (
        SELECT * FROM scores_afinidad WHERE rank_origen = 1
      ),
      nacional AS (
        SELECT
          pt.producto AS prod_candidato,
          ROUND(pt.clientes_prod * 100.0 / t.total_clientes, 1) AS pct_nacional,
          1.0 AS lift_nacional
        FROM prod_totales pt
        CROSS JOIN totales t
      ),
      ranked_sugerencias AS (
        SELECT
          cand.CUSTOMER_ID,
          cand.prod_candidato,
          CASE WHEN ba.prod_candidato IS NOT NULL THEN 'Afinidad' ELSE 'Tasa nacional' END AS metodo,
          COALESCE(ba.confianza_pct, nac.pct_nacional) AS pct,
          COALESCE(ba.lift, nac.lift_nacional) AS lift,
          ba.prod_origen_explicativo,
          ROW_NUMBER() OVER(
            PARTITION BY cand.CUSTOMER_ID
            ORDER BY 
              CASE WHEN ba.prod_candidato IS NOT NULL THEN 1 ELSE 2 END,
              COALESCE(ba.confianza_pct, nac.pct_nacional) DESC,
              COALESCE(ba.lift, nac.lift_nacional) DESC
          ) AS sugerencia_num
        FROM candidatos cand
        LEFT JOIN best_afinidad ba ON cand.CUSTOMER_ID = ba.CUSTOMER_ID AND cand.prod_candidato = ba.prod_candidato
        LEFT JOIN nacional nac ON cand.prod_candidato = nac.prod_candidato
      )
      SELECT
        CUSTOMER_ID AS customer_id,
        MAX(metodo) AS metodo,
        MAX(CASE WHEN sugerencia_num = 1 THEN INITCAP(REPLACE(prod_candidato, '_', ' ')) END) AS producto_1,
        MAX(CASE WHEN sugerencia_num = 1 THEN pct END) AS pct_1,
        MAX(CASE WHEN sugerencia_num = 1 THEN lift END) AS lift_1,
        MAX(CASE WHEN sugerencia_num = 1 THEN
          CASE
            WHEN metodo = 'Afinidad' THEN CONCAT(CAST(pct AS STRING), ' % de los clientes con ', INITCAP(REPLACE(prod_origen_explicativo, '_', ' ')), ' también tiene ', INITCAP(REPLACE(prod_candidato, '_', ' ')), ' (lift ', CAST(lift AS STRING), ')')
            ELSE CONCAT(CAST(pct AS STRING), ' % de penetración nacional en la red Actinver')
          END
        END) AS porque_1,
        MAX(CASE WHEN sugerencia_num = 2 THEN INITCAP(REPLACE(prod_candidato, '_', ' ')) END) AS producto_2,
        MAX(CASE WHEN sugerencia_num = 2 THEN pct END) AS pct_2,
        MAX(CASE WHEN sugerencia_num = 2 THEN lift END) AS lift_2,
        MAX(CASE WHEN sugerencia_num = 3 THEN INITCAP(REPLACE(prod_candidato, '_', ' ')) END) AS producto_3,
        MAX(CASE WHEN sugerencia_num = 3 THEN pct END) AS pct_3,
        MAX(CASE WHEN sugerencia_num = 3 THEN lift END) AS lift_3
      FROM ranked_sugerencias
      WHERE sugerencia_num <= 3
      GROUP BY CUSTOMER_ID
    ;;
  }

  dimension: customer_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metodo {
    type: string
    label: "Método de Recomendación"
    description: "Afinidad (Cross-sell personalizado) o Tasa nacional (para clientes Solo Eje)"
    sql: ${TABLE}.metodo ;;
  }

  dimension: producto_1 {
    type: string
    label: "Sugerencia 1 (Principal)"
    sql: ${TABLE}.producto_1 ;;
  }

  dimension: pct_1 {
    type: number
    label: "% Adopción Sugerencia 1"
    sql: ${TABLE}.pct_1 ;;
    value_format: "0.0\"%\""
  }

  dimension: lift_1 {
    type: number
    label: "Lift Sugerencia 1"
    sql: ${TABLE}.lift_1 ;;
    value_format: "0.00"
  }

  dimension: porque_1 {
    type: string
    label: "Por Qué Sugerencia 1"
    sql: ${TABLE}.porque_1 ;;
  }

  dimension: producto_2 {
    type: string
    label: "Sugerencia 2"
    sql: ${TABLE}.producto_2 ;;
  }

  dimension: pct_2 {
    type: number
    label: "% Adopción Sugerencia 2"
    sql: ${TABLE}.pct_2 ;;
    value_format: "0.0\"%\""
  }

  dimension: lift_2 {
    type: number
    label: "Lift Sugerencia 2"
    sql: ${TABLE}.lift_2 ;;
    value_format: "0.00"
  }

  dimension: producto_3 {
    type: string
    label: "Sugerencia 3"
    sql: ${TABLE}.producto_3 ;;
  }

  dimension: pct_3 {
    type: number
    label: "% Adopción Sugerencia 3"
    sql: ${TABLE}.pct_3 ;;
    value_format: "0.0\"%\""
  }

  dimension: lift_3 {
    type: number
    label: "Lift Sugerencia 3"
    sql: ${TABLE}.lift_3 ;;
    value_format: "0.00"
  }

  # Dimensiones retrocompatibles
  dimension: siguiente_producto_sugerido {
    type: string
    label: "Producto Sugerido"
    sql: ${producto_1} ;;
  }

  dimension: pct_grupo_que_lo_tiene {
    type: number
    label: "% de su Grupo que lo Posee"
    sql: ${pct_1} ;;
    value_format: "0.0\"%\""
  }

  dimension: lift_estimado {
    type: number
    label: "Veces más Probable (Lift)"
    sql: ${lift_1} ;;
    value_format: "0.00"
  }

  dimension: razon_recomendacion {
    type: string
    label: "Justificación de Sugerencia"
    sql: ${porque_1} ;;
  }

  measure: count {
    type: count
    label: "Total Clientes con Sugerencia"
    value_format_name: decimal_0
  }
}
