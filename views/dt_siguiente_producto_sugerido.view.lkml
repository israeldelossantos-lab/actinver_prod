view: dt_siguiente_producto_sugerido {
  derived_table: {
    sql: SELECT 
        CUSTOMER_ID AS customer_id,
        CASE
          WHEN COALESCE(HAS_FONDOS_DE_DEUDA, 0) = 0 THEN 'Fondos de Deuda'
          WHEN COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) = 0 THEN 'Mercado de Dinero Reporto'
          WHEN COALESCE(HAS_RENTA_VARIABLE, 0) = 0 THEN 'Renta Variable'
          WHEN COALESCE(HAS_PRLV, 0) = 0 THEN 'PRLV'
          WHEN COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) = 0 THEN 'Notas Estructuradas'
          ELSE 'Diversificación Avanzada'
        END AS siguiente_producto_sugerido,
        CASE
          WHEN COALESCE(HAS_FONDOS_DE_DEUDA, 0) = 0 THEN 49.3
          WHEN COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) = 0 THEN 19.0
          WHEN COALESCE(HAS_RENTA_VARIABLE, 0) = 0 THEN 17.6
          WHEN COALESCE(HAS_PRLV, 0) = 0 THEN 16.2
          WHEN COALESCE(HAS_NOTAS_ESTRUCTURADAS, 0) = 0 THEN 4.7
          ELSE 2.5
        END AS pct_grupo_que_lo_tiene,
        CASE
          WHEN COALESCE(HAS_FONDOS_DE_DEUDA, 0) = 0 THEN 1.35
          WHEN COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) = 0 THEN 1.18
          WHEN COALESCE(HAS_RENTA_VARIABLE, 0) = 0 THEN 1.22
          ELSE 1.10
        END AS lift_estimado,
        CASE
          WHEN COALESCE(HAS_FONDOS_DE_DEUDA, 0) = 0 THEN 'Producto ancla de mayor adopción en la red'
          WHEN COALESCE(HAS_MERCADO_DE_DINERO_REPORTO, 0) = 0 THEN 'Complemento de liquidez a corto plazo'
          WHEN COALESCE(HAS_RENTA_VARIABLE, 0) = 0 THEN 'Estrategia de crecimiento y plusvalía'
          ELSE 'Optimización de portafolio patrimonial'
        END AS razon_recomendacion
      FROM `@{dataset_actinver}.CLIENTE_PRODUCTO_09_10_2026` ;;
  }

  dimension: customer_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: siguiente_producto_sugerido {
    type: string
    label: "Producto Sugerido"
    description: "Siguiente mejor producto recomendado según el escalón y tenencia actual"
    sql: ${TABLE}.siguiente_producto_sugerido ;;
  }

  dimension: pct_grupo_que_lo_tiene {
    type: number
    label: "% de su Grupo que lo Posee"
    sql: ${TABLE}.pct_grupo_que_lo_tiene ;;
    value_format: "0.0\"%\""
  }

  dimension: lift_estimado {
    type: number
    label: "Veces más Probable (Lift)"
    sql: ${TABLE}.lift_estimado ;;
    value_format: "0.00"
  }

  dimension: razon_recomendacion {
    type: string
    label: "Justificación de Sugerencia"
    sql: ${TABLE}.razon_recomendacion ;;
  }

  measure: count {
    type: count
    label: "Total Clientes con Sugerencia"
    value_format_name: decimal_0
  }
}
