view: prima_emitida_2026 {
  sql_table_name: `@{dataset_actinver}.PRIMA_EMITIDA_2026` ;;

  dimension: key_emision {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.POLIZA, '_', CAST(${TABLE}.ENDOSO AS STRING), '_', CAST(${TABLE}.RECIBO AS STRING), '_', CAST(${TABLE}.ITEM AS STRING)) ;;
  }

  dimension: poliza {
    type: string
    label: "Póliza"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: endoso {
    type: number
    label: "Endoso"
    sql: ${TABLE}.ENDOSO ;;
  }

  dimension: recibo {
    type: number
    label: "Recibo"
    sql: ${TABLE}.RECIBO ;;
  }

  dimension: item {
    type: number
    label: "Item"
    sql: ${TABLE}.ITEM ;;
  }

  dimension: baja_logica {
    type: number
    label: "Baja Lógica"
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  dimension_group: fecha_emision_poliza {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha de Emisión Póliza"
    sql: ${TABLE}.FECHA_EMISION_POLIZA ;;
  }

  dimension: fecha_actualizacion_parsed {
    type: date
    label: "Fecha Actualización (Parsed)"
    description: "Fecha parseada de texto dd/mm/yy"
    sql: PARSE_DATE('%d/%m/%y', ${TABLE}.FECHA_ACTUALIZACION) ;;
  }

  dimension: id_producto {
    type: number
    label: "ID Producto"
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: id_tipo_transaccion {
    type: number
    label: "ID Tipo Transacción"
    sql: ${TABLE}.ID_TIPO_TRANSACCION ;;
  }

  dimension: tipo_transaccion {
    type: string
    label: "Tipo de Transacción"
    sql: ${TABLE}.TIPO_TRANSACCION ;;
  }

  dimension: prima_directa {
    type: number
    hidden: yes
    sql: ${TABLE}.PRIMA_DIRECTA ;;
  }

  dimension: prima_total {
    type: number
    hidden: yes
    sql: ${TABLE}.PRIMA_TOTAL ;;
  }

  dimension: suma_asegurada {
    type: number
    label: "Suma Asegurada"
    sql: ${TABLE}.SUMA_ASEGURADA ;;
    value_format: "$#,##0"
  }

  dimension: es_cancelacion {
    type: yesno
    label: "Es Cancelación (Prima < 0)"
    sql: ${TABLE}.PRIMA_DIRECTA < 0 ;;
  }

  measure: count {
    type: count
    label: "Total Movimientos de Emisión"
    value_format_name: decimal_0
  }

  measure: count_polizas {
    type: count_distinct
    label: "Pólizas Emitidas Únicas"
    sql: ${poliza} ;;
    value_format_name: decimal_0
  }

  measure: prima_neta_emitida {
    type: sum
    label: "Prima Neta Emitida (MXN)"
    description: "Suma de prima directa neta (incluyendo cancelaciones con importes negativos)"
    sql: ${prima_directa} ;;
    value_format: "$#,##0"
  }

  measure: prima_bruta_emitida {
    type: sum
    label: "Prima Bruta Emitida"
    sql: CASE WHEN ${prima_directa} > 0 THEN ${prima_directa} ELSE 0 END ;;
    value_format: "$#,##0"
  }

  measure: prima_cancelada {
    type: sum
    label: "Prima Cancelada"
    sql: CASE WHEN ${prima_directa} < 0 THEN ABS(${prima_directa}) ELSE 0 END ;;
    value_format: "$#,##0"
  }

  measure: suma_asegurada_total {
    type: sum
    label: "Suma Asegurada Total"
    sql: ${suma_asegurada} ;;
    value_format: "$#,##0"
  }
}
