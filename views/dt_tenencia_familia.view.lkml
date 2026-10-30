view: dt_tenencia_familia {
  derived_table: {
    sql: WITH base_cliente AS (
        SELECT
          cp.CUSTOMER_ID AS customer_id,
          c.id_centro_financiero,
          COALESCE(cp.HAS_CUENTA_EJE, 0) / 1.0 AS pct_eje,
          (COALESCE(cp.HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(cp.HAS_MERCADO_DE_DINERO_DIRECTO, 0) + COALESCE(cp.HAS_PRLV, 0) + COALESCE(cp.HAS_CEDE, 0) + COALESCE(cp.HAS_PAGARE_BURSATIL, 0)) / 5.0 AS pct_dinero,
          (COALESCE(cp.HAS_FONDOS_DE_DEUDA, 0) + COALESCE(cp.HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(cp.HAS_FONDO_DE_FONDOS, 0)) / 3.0 AS pct_fondos,
          (COALESCE(cp.HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(cp.HAS_RENTA_VARIABLE, 0) + COALESCE(cp.HAS_WARRANS, 0) + COALESCE(cp.HAS_NOTAS_ESTRUCTURADAS, 0)) / 4.0 AS pct_capitales,
          (COALESCE(cp.HAS_EFECTIVO, 0) + COALESCE(cp.HAS_SAVING, 0) + COALESCE(cp.HAS_MEXDOLAR, 0)) / 3.0 AS pct_liquidez,
          COALESCE(cp.HAS_CREDITO, 0) / 1.0 AS pct_credito
        FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` cp
        LEFT JOIN (
          SELECT DISTINCT CAST(id_cliente AS STRING) AS id_cliente_str, id_centro_financiero 
          FROM `@{dataset_spine}.cuenta`
        ) c ON cp.CUSTOMER_ID = c.id_cliente_str
      ),
      promedios_sucursal AS (
        SELECT
          id_centro_financiero,
          AVG(pct_eje) AS avg_eje_suc,
          AVG(pct_dinero) AS avg_dinero_suc,
          AVG(pct_fondos) AS avg_fondos_suc,
          AVG(pct_capitales) AS avg_capitales_suc,
          AVG(pct_liquidez) AS avg_liquidez_suc,
          AVG(pct_credito) AS avg_credito_suc
        FROM base_cliente
        GROUP BY id_centro_financiero
      ),
      promedios_red AS (
        SELECT
          AVG(pct_eje) AS avg_eje_red,
          AVG(pct_dinero) AS avg_dinero_red,
          AVG(pct_fondos) AS avg_fondos_red,
          AVG(pct_capitales) AS avg_capitales_red,
          AVG(pct_liquidez) AS avg_liquidez_red,
          AVG(pct_credito) AS avg_credito_red
        FROM base_cliente
      )
      SELECT
        CONCAT(b.customer_id, '_1') AS pk,
        b.customer_id,
        '1. Cliente' AS nivel,
        b.pct_eje AS pct_cuenta_eje,
        b.pct_dinero AS pct_mercado_dinero,
        b.pct_fondos AS pct_fondos_inversion,
        b.pct_capitales AS pct_mercado_capitales,
        b.pct_liquidez AS pct_liquidez_divisas,
        b.pct_credito AS pct_credito
      FROM base_cliente b
      UNION ALL
      SELECT
        CONCAT(b.customer_id, '_2') AS pk,
        b.customer_id,
        '2. Sucursal' AS nivel,
        s.avg_eje_suc AS pct_cuenta_eje,
        s.avg_dinero_suc AS pct_mercado_dinero,
        s.avg_fondos_suc AS pct_fondos_inversion,
        s.avg_capitales_suc AS pct_mercado_capitales,
        s.avg_liquidez_suc AS pct_liquidez_divisas,
        s.avg_credito_suc AS pct_credito
      FROM base_cliente b
      JOIN promedios_sucursal s ON b.id_centro_financiero = s.id_centro_financiero
      UNION ALL
      SELECT
        CONCAT(b.customer_id, '_3') AS pk,
        b.customer_id,
        '3. Red' AS nivel,
        r.avg_eje_red AS pct_cuenta_eje,
        r.avg_dinero_red AS pct_mercado_dinero,
        r.avg_fondos_red AS pct_fondos_inversion,
        r.avg_capitales_red AS pct_mercado_capitales,
        r.avg_liquidez_red AS pct_liquidez_divisas,
        r.avg_credito_red AS pct_credito
      FROM base_cliente b
      CROSS JOIN promedios_red r ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: customer_id {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: nivel {
    type: string
    label: "Nivel Comparativo"
    sql: ${TABLE}.nivel ;;
  }

  measure: pct_cuenta_eje {
    type: average
    label: "Cuenta Eje"
    sql: ${TABLE}.pct_cuenta_eje ;;
    value_format: "0.0%"
  }

  measure: pct_mercado_dinero {
    type: average
    label: "Mercado de Dinero"
    sql: ${TABLE}.pct_mercado_dinero ;;
    value_format: "0.0%"
  }

  measure: pct_fondos_inversion {
    type: average
    label: "Fondos de Inversión"
    sql: ${TABLE}.pct_fondos_inversion ;;
    value_format: "0.0%"
  }

  measure: pct_mercado_capitales {
    type: average
    label: "Mercado de Capitales"
    sql: ${TABLE}.pct_mercado_capitales ;;
    value_format: "0.0%"
  }

  measure: pct_liquidez_divisas {
    type: average
    label: "Liquidez y Divisas"
    sql: ${TABLE}.pct_liquidez_divisas ;;
    value_format: "0.0%"
  }

  measure: pct_credito {
    type: average
    label: "Crédito"
    sql: ${TABLE}.pct_credito ;;
    value_format: "0.0%"
  }
}
