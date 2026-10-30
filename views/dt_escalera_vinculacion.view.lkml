view: dt_escalera_vinculacion {
  derived_table: {
    sql: SELECT
        CUSTOMER_ID AS customer_id,
        COALESCE(HAS_CUENTA_EJE, 0) AS has_cuenta_eje,
        (
          COALESCE(HAS_MERCADO_DE_CAPITALES, 0) +
          COALESCE(HAS_PRLV, 0) +
          COALESCE(HAS_WARRANS, 0) +
          COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) +
          COALESCE(HAS_FONDOS_DE_COBERTURA, 0) +
          COALESCE(HAS_FONDO_DE_FONDOS, 0) +
          COALESCE(HAS_MEXDOLAR, 0) +
          COALESCE(HAS_SAVING, 0) +
          COALESCE(HAS_EFECTIVO, 0) +
          COALESCE(HAS_RENTA_VARIABLE, 0) +
          COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) +
          COALESCE(HAS_CEDE, 0) +
          COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0) +
          COALESCE(HAS_FONDOS_DE_DEUDA, 0) +
          COALESCE(HAS_PAGARE_BURSATIL, 0) +
          COALESCE(HAS_CREDITO, 0)
        ) AS total_productos_validos,
        CASE
          WHEN COALESCE(HAS_CUENTA_EJE, 0) = 1 AND (
            COALESCE(HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(HAS_PRLV, 0) + COALESCE(HAS_WARRANS, 0) +
            COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) + COALESCE(HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(HAS_FONDO_DE_FONDOS, 0) +
            COALESCE(HAS_MEXDOLAR, 0) + COALESCE(HAS_SAVING, 0) + COALESCE(HAS_EFECTIVO, 0) +
            COALESCE(HAS_RENTA_VARIABLE, 0) + COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(HAS_CEDE, 0) +
            COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0) + COALESCE(HAS_FONDOS_DE_DEUDA, 0) + COALESCE(HAS_PAGARE_BURSATIL, 0) +
            COALESCE(HAS_CREDITO, 0)
          ) = 0 THEN 'Solo eje'
          WHEN COALESCE(HAS_CUENTA_EJE, 0) = 1 AND (
            COALESCE(HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(HAS_PRLV, 0) + COALESCE(HAS_WARRANS, 0) +
            COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) + COALESCE(HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(HAS_FONDO_DE_FONDOS, 0) +
            COALESCE(HAS_MEXDOLAR, 0) + COALESCE(HAS_SAVING, 0) + COALESCE(HAS_EFECTIVO, 0) +
            COALESCE(HAS_RENTA_VARIABLE, 0) + COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(HAS_CEDE, 0) +
            COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0) + COALESCE(HAS_FONDOS_DE_DEUDA, 0) + COALESCE(HAS_PAGARE_BURSATIL, 0) +
            COALESCE(HAS_CREDITO, 0)
          ) = 1 THEN 'Eje + 1'
          WHEN COALESCE(HAS_CUENTA_EJE, 0) = 1 AND (
            COALESCE(HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(HAS_PRLV, 0) + COALESCE(HAS_WARRANS, 0) +
            COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) + COALESCE(HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(HAS_FONDO_DE_FONDOS, 0) +
            COALESCE(HAS_MEXDOLAR, 0) + COALESCE(HAS_SAVING, 0) + COALESCE(HAS_EFECTIVO, 0) +
            COALESCE(HAS_RENTA_VARIABLE, 0) + COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(HAS_CEDE, 0) +
            COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0) + COALESCE(HAS_FONDOS_DE_DEUDA, 0) + COALESCE(HAS_PAGARE_BURSATIL, 0) +
            COALESCE(HAS_CREDITO, 0)
          ) = 2 THEN 'Eje + 2'
          WHEN COALESCE(HAS_CUENTA_EJE, 0) = 1 AND (
            COALESCE(HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(HAS_PRLV, 0) + COALESCE(HAS_WARRANS, 0) +
            COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) + COALESCE(HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(HAS_FONDO_DE_FONDOS, 0) +
            COALESCE(HAS_MEXDOLAR, 0) + COALESCE(HAS_SAVING, 0) + COALESCE(HAS_EFECTIVO, 0) +
            COALESCE(HAS_RENTA_VARIABLE, 0) + COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(HAS_CEDE, 0) +
            COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0) + COALESCE(HAS_FONDOS_DE_DEUDA, 0) + COALESCE(HAS_PAGARE_BURSATIL, 0) +
            COALESCE(HAS_CREDITO, 0)
          ) >= 3 THEN 'Eje + 3 o más'
          ELSE 'Sin eje'
        END AS escalon_vinculacion,
        CASE WHEN (COALESCE(HAS_PRLV, 0) + COALESCE(HAS_CEDE, 0) + COALESCE(HAS_PAGARE_BURSATIL, 0) + COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) + COALESCE(HAS_MERCADO_DE_DINERO_DIRECTO, 0)) > 0 THEN 1 ELSE 0 END AS tiene_mercado_dinero,
        CASE WHEN (COALESCE(HAS_MERCADO_DE_CAPITALES, 0) + COALESCE(HAS_RENTA_VARIABLE, 0)) > 0 THEN 1 ELSE 0 END AS tiene_renta_variable,
        CASE WHEN (COALESCE(HAS_FONDOS_DE_DEUDA, 0) + COALESCE(HAS_FONDOS_DE_COBERTURA, 0) + COALESCE(HAS_FONDO_DE_FONDOS, 0)) > 0 THEN 1 ELSE 0 END AS tiene_fondos,
        CASE WHEN (COALESCE(HAS_WARRANS, 0) + COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0)) > 0 THEN 1 ELSE 0 END AS tiene_derivados_estructurados,
        CASE WHEN (COALESCE(HAS_MEXDOLAR, 0) + COALESCE(HAS_SAVING, 0) + COALESCE(HAS_EFECTIVO, 0)) > 0 THEN 1 ELSE 0 END AS tiene_divisas_ahorro,
        CASE WHEN COALESCE(HAS_CREDITO, 0) > 0 THEN 1 ELSE 0 END AS tiene_credito
      FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` ;;
  }

  dimension: customer_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_id {
    type: string
    label: "ID de Cliente"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.customer_id ;;
  }

  dimension: total_productos_validos {
    type: number
    label: "Total Productos Válidos"
    description: "Suma de los 16 productos de inversión válidos (excluyendo cuenta eje y pendiente por liquidar)"
    sql: ${TABLE}.total_productos_validos ;;
  }

  dimension: escalon_orden {
    type: number
    hidden: yes
    sql: CASE
      WHEN ${TABLE}.escalon_vinculacion = 'Sin eje' THEN 1
      WHEN ${TABLE}.escalon_vinculacion = 'Solo eje' THEN 2
      WHEN ${TABLE}.escalon_vinculacion = 'Eje + 1' THEN 3
      WHEN ${TABLE}.escalon_vinculacion = 'Eje + 2' THEN 4
      WHEN ${TABLE}.escalon_vinculacion = 'Eje + 3 o más' THEN 5
      ELSE 6
    END ;;
  }

  dimension: escalon_vinculacion {
    type: string
    label: "Escalón de Vinculación"
    description: "Nivel en la escalera de vinculación (Solo eje, Eje + 1, Eje + 2, Eje + 3 o más, Sin eje)"
    sql: ${TABLE}.escalon_vinculacion ;;
    order_by_field: escalon_orden
  }

  dimension: es_solo_eje {
    type: yesno
    label: "Es Solo Eje"
    sql: ${escalon_vinculacion} = 'Solo eje' ;;
  }

  dimension: es_multiproducto {
    type: yesno
    label: "Es Multiproducto"
    sql: ${total_productos_validos} >= 2 ;;
  }

  dimension: tiene_mercado_dinero {
    type: yesno
    label: "Tiene Mercado de Dinero"
    sql: ${TABLE}.tiene_mercado_dinero = 1 ;;
  }

  dimension: tiene_renta_variable {
    type: yesno
    label: "Tiene Renta Variable"
    sql: ${TABLE}.tiene_renta_variable = 1 ;;
  }

  dimension: tiene_fondos {
    type: yesno
    label: "Tiene Fondos"
    sql: ${TABLE}.tiene_fondos = 1 ;;
  }

  dimension: tiene_derivados_estructurados {
    type: yesno
    label: "Tiene Derivados/Estructurados"
    sql: ${TABLE}.tiene_derivados_estructurados = 1 ;;
  }

  dimension: tiene_divisas_ahorro {
    type: yesno
    label: "Tiene Divisas/Ahorro"
    sql: ${TABLE}.tiene_divisas_ahorro = 1 ;;
  }

  dimension: tiene_credito {
    type: yesno
    label: "Tiene Crédito"
    sql: ${TABLE}.tiene_credito = 1 ;;
  }

  measure: count {
    type: count_distinct
    sql: ${customer_key} ;;
    label: "Total Clientes con Tenencia"
    value_format_name: decimal_0
  }

  measure: productos_promedio {
    type: average
    label: "Productos Válidos Promedio"
    sql: ${total_productos_validos} ;;
    value_format: "0.00"
  }

  measure: clientes_solo_eje {
    type: count_distinct
    sql: ${customer_key} ;;
    label: "Clientes Solo Eje"
    filters: [escalon_vinculacion: "Solo eje"]
    value_format_name: decimal_0
  }

  measure: pct_solo_eje {
    type: number
    label: "% Clientes Solo Eje"
    sql: 1.0 * ${clientes_solo_eje} / NULLIF(${count}, 0) ;;
    value_format: "0.0%"
  }

  measure: clientes_multiproducto {
    type: count_distinct
    sql: ${customer_key} ;;
    label: "Clientes Multiproducto (2+)"
    filters: [es_multiproducto: "yes"]
    value_format_name: decimal_0
  }

  measure: pct_multiproducto {
    type: number
    label: "% Multiproducto"
    sql: 1.0 * ${clientes_multiproducto} / NULLIF(${count}, 0) ;;
    value_format: "0.0%"
  }
}
