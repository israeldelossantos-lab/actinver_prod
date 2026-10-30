view: dt_desviacion_pago {
  derived_table: {
    sql: SELECT
        CONCAT(POLIZA, '_', RECIBO, '_', CAST(EXHIBICION AS STRING), '_', CAST(ID_RIESGO_CONTABLE AS STRING)) AS key_recibo,
        POLIZA AS poliza,
        RECIBO AS recibo,
        EXHIBICION AS exhibicion,
        ID_RIESGO_CONTABLE AS id_riesgo_contable,
        FECHA_INICIO_VIGENCIA_RECIBO AS fecha_inicio_vigencia_recibo,
        SAFE_CAST(FECHA_PAGO AS TIMESTAMP) AS fecha_pago,
        DATE_DIFF(DATE(FECHA_PAGO), DATE(FECHA_INICIO_VIGENCIA_RECIBO), DAY) AS dias_desviacion,
        CASE
          WHEN DATE_DIFF(DATE(FECHA_PAGO), DATE(FECHA_INICIO_VIGENCIA_RECIBO), DAY) < 0 THEN '1. Anticipado (< 0 d)'
          WHEN DATE_DIFF(DATE(FECHA_PAGO), DATE(FECHA_INICIO_VIGENCIA_RECIBO), DAY) <= @{umbral_gracia_dias} THEN CONCAT('2. Gracia (0-', CAST(@{umbral_gracia_dias} AS STRING), ' d)')
          WHEN DATE_DIFF(DATE(FECHA_PAGO), DATE(FECHA_INICIO_VIGENCIA_RECIBO), DAY) <= @{umbral_critico_dias} THEN CONCAT('3. Atrasado (', CAST(@{umbral_gracia_dias} + 1 AS STRING), '-', CAST(@{umbral_critico_dias} AS STRING), ' d)')
          ELSE CONCAT('4. Crítico (> ', CAST(@{umbral_critico_dias} AS STRING), ' d)')
        END AS rango_desviacion_pago,
        PRIMA_TOTAL AS prima_total
      FROM `@{dataset_seguros}.PRIMA_PAGADA_2026`
      WHERE BAJA_LOGICA = 0 ;;
  }

  dimension: key_recibo {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.key_recibo ;;
  }

  dimension: poliza_key {
    hidden: yes
    type: string
    sql: ${TABLE}.poliza ;;
  }

  dimension: poliza {
    type: string
    label: "Póliza"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.poliza ;;
  }

  dimension: recibo {
    type: string
    label: "Número de Recibo"
    sql: ${TABLE}.recibo ;;
  }

  dimension: exhibicion {
    type: number
    label: "Exhibición"
    sql: ${TABLE}.exhibicion ;;
  }

  dimension: id_riesgo_contable {
    type: number
    label: "ID Riesgo Contable"
    sql: ${TABLE}.id_riesgo_contable ;;
  }

  dimension_group: fecha_inicio_vigencia_recibo {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.fecha_inicio_vigencia_recibo ;;
  }

  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: timestamp
    sql: ${TABLE}.fecha_pago ;;
  }.fecha_pago ;;
  }

  dimension: dias_desviacion {
    type: number
    label: "Días de Desviación de Pago"
    description: "Diferencia en días entre fecha de pago y fecha de inicio de vigencia del recibo"
    sql: ${TABLE}.dias_desviacion ;;
  }

  dimension: rango_desviacion_pago {
    type: string
    label: "Rango de Desviación de Pago"
    description: "Clasificación de puntualidad de cobranza: Anticipado, Gracia, Atrasado, Crítico"
    sql: ${TABLE}.rango_desviacion_pago ;;
  }

  dimension: es_a_tiempo {
    type: yesno
    label: "Cobranza a Tiempo (Gracia o Anticipado)"
    sql: ${dias_desviacion} <= @{umbral_gracia_dias} ;;
  }

  dimension: es_critico {
    type: yesno
    label: "Cobranza Crítica (> 30 días)"
    sql: ${dias_desviacion} > @{umbral_critico_dias} ;;
  }

  dimension: prima_total {
    type: number
    hidden: yes
    sql: ${TABLE}.prima_total ;;
  }

  measure: total_recibos {
    type: count
    label: "Total Recibos Pagados"
    value_format_name: decimal_0
  }

  measure: desviacion_promedio_dias {
    type: average
    label: "Desviación Promedio (Días)"
    sql: ${dias_desviacion} ;;
    value_format: "0.0"
  }

  measure: recibos_a_tiempo {
    type: count
    label: "Recibos a Tiempo"
    filters: [es_a_tiempo: "yes"]
    value_format_name: decimal_0
  }

  measure: pct_recibos_a_tiempo {
    type: number
    label: "% Cobranza a Tiempo"
    sql: 1.0 * ${recibos_a_tiempo} / NULLIF(${total_recibos}, 0) ;;
    value_format: "0.0%"
  }

  measure: recibos_criticos {
    type: count
    label: "Recibos Críticos (> 30 d)"
    filters: [es_critico: "yes"]
    value_format_name: decimal_0
  }

  measure: pct_recibos_criticos {
    type: number
    label: "% Cobranza Crítica"
    sql: 1.0 * ${recibos_criticos} / NULLIF(${total_recibos}, 0) ;;
    value_format: "0.0%"
  }

  measure: monto_prima_pagada {
    type: sum
    label: "Monto Prima Pagada"
    sql: ${prima_total} ;;
    value_format: "$#,##0"
  }
}
