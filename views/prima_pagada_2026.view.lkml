view: prima_pagada_2026 {
  sql_table_name: `actinver_qa.PRIMA_PAGADA_2026` ;;

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }
  dimension: bonificaciones {
    type: number
    sql: ${TABLE}.BONIFICACIONES ;;
  }
  dimension: comisiones {
    type: number
    sql: ${TABLE}.COMISIONES ;;
  }
  dimension: conexos {
    type: number
    sql: ${TABLE}.CONEXOS ;;
  }
  dimension: derechos {
    type: number
    sql: ${TABLE}.DERECHOS ;;
  }
  dimension: endoso {
    type: number
    sql: ${TABLE}.ENDOSO ;;
  }
  dimension: exhibicion {
    type: number
    sql: ${TABLE}.EXHIBICION ;;
  }
  dimension_group: fecha_actualizacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_ACTUALIZACION ;;
  }
  dimension_group: fecha_fin_vigencia_exhibicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_FIN_VIGENCIA_EXHIBICION ;;
  }
  dimension_group: fecha_fin_vigencia_recibo {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_FIN_VIGENCIA_RECIBO ;;
  }
  dimension_group: fecha_inicio_vigencia_exhibicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_INICIO_VIGENCIA_EXHIBICION ;;
  }
  dimension_group: fecha_inicio_vigencia_recibo {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_INICIO_VIGENCIA_RECIBO ;;
  }
  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FECHA_PAGO ;;
  }
  dimension: id_moneda {
    type: number
    sql: ${TABLE}.ID_MONEDA ;;
  }
  dimension: id_origen {
    type: number
    sql: ${TABLE}.ID_ORIGEN ;;
  }
  dimension: id_riesgo_contable {
    type: number
    sql: ${TABLE}.ID_RIESGO_CONTABLE ;;
  }
  dimension: id_tipo_transaccion {
    type: number
    sql: ${TABLE}.ID_TIPO_TRANSACCION ;;
  }
  dimension: iva {
    type: number
    sql: ${TABLE}.IVA ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.LAST_UPDATE ;;
  }
  dimension: poliza {
    type: string
    sql: ${TABLE}.POLIZA ;;
  }
  dimension: prima_directa {
    type: number
    sql: ${TABLE}.PRIMA_DIRECTA ;;
  }
  dimension: prima_total {
    type: number
    sql: ${TABLE}.PRIMA_TOTAL ;;
  }
  dimension: recargos {
    type: number
    sql: ${TABLE}.RECARGOS ;;
  }
  dimension: recibo {
    type: string
    sql: ${TABLE}.RECIBO ;;
  }
  dimension_group: snapshot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.SNAPSHOT_DATE ;;
  }
  dimension: usuario_actualizacion {
    type: string
    sql: ${TABLE}.USUARIO_ACTUALIZACION ;;
  }
  measure: count {
    type: count
  }
}
