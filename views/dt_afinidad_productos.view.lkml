view: dt_afinidad_productos {
  derived_table: {
    sql: WITH unpivoted AS (
        SELECT CUSTOMER_ID, REPLACE(producto, 'HAS_', '') AS producto
        FROM `@{dataset_actinver}.CLIENTE_PRODUCTO_09_10_2026`
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
        SELECT COUNT(DISTINCT CUSTOMER_ID) AS total_clientes FROM `@{dataset_actinver}.CLIENTE_PRODUCTO_09_10_2026`
      ),
      prod_totales AS (
        SELECT producto, COUNT(DISTINCT CUSTOMER_ID) AS clientes_prod
        FROM unpivoted
        GROUP BY 1
      )
      SELECT 
        CONCAT(p1.producto, ' -> ', p2.producto) AS key_par,
        p1.producto AS producto_origen,
        p2.producto AS producto_destino,
        COUNT(DISTINCT p1.CUSTOMER_ID) AS clientes_ambos,
        ROUND(COUNT(DISTINCT p1.CUSTOMER_ID) * 100.0 / t1.clientes_prod, 1) AS confianza_pct,
        ROUND((COUNT(DISTINCT p1.CUSTOMER_ID) * t.total_clientes * 1.0) / (t1.clientes_prod * t2.clientes_prod), 2) AS lift
      FROM unpivoted p1
      JOIN unpivoted p2 ON p1.CUSTOMER_ID = p2.CUSTOMER_ID AND p1.producto != p2.producto
      JOIN prod_totales t1 ON p1.producto = t1.producto
      JOIN prod_totales t2 ON p2.producto = t2.producto
      CROSS JOIN totales t
      GROUP BY 1, 2, 3, t1.clientes_prod, t2.clientes_prod, t.total_clientes ;;
  }

  dimension: key_par {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.key_par ;;
  }

  dimension: producto_origen {
    type: string
    label: "Producto Poseído (Origen)"
    sql: ${TABLE}.producto_origen ;;
  }

  dimension: producto_destino {
    type: string
    label: "Producto Cruzado (Destino)"
    sql: ${TABLE}.producto_destino ;;
  }

  dimension: clientes_ambos {
    type: number
    label: "Clientes con Ambos Productos"
    sql: ${TABLE}.clientes_ambos ;;
  }

  dimension: confianza_pct {
    type: number
    label: "Confianza (%)"
    description: "% de clientes que teniendo el producto origen también poseen el producto destino"
    sql: ${TABLE}.confianza_pct ;;
    value_format: "0.0\"%\""
  }

  dimension: lift {
    type: number
    label: "Lift de Afinidad"
    description: "Índice de afinidad cruzada (> 1 indica mayor probabilidad de compra conjunta)"
    sql: ${TABLE}.lift ;;
    value_format: "0.00"
  }

  measure: clientes_con_ambos {
    type: sum
    label: "Clientes con Ambos"
    sql: ${clientes_ambos} ;;
    value_format_name: decimal_0
  }

  measure: lift_promedio {
    type: average
    label: "Lift Promedio"
    sql: ${lift} ;;
    value_format: "0.00"
  }
}
