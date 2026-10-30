view: prima_pagada_2026 {
  sql_table_name: `@{dataset_seguros}.PRIMA_PAGADA_2026` ;;

  dimension: key_pago {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(
      CAST(${TABLE}.POLIZA AS STRING), '|',
      CAST(${TABLE}.RECIBO AS STRING), '|',
      CAST(${TABLE}.EXHIBICION AS STRING), '|',
      CAST(${TABLE}.ID_RIESGO_CONTABLE AS STRING)
    ) ;;
  }

  dimension: baja_logica {
    type: number
    label: "Baja Lógica"
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  dimension: bonificaciones {
    type: number
    label: "Bonificaciones"
    sql: ${TABLE}.BONIFICACIONES ;;
  }

  dimension: comisiones {
    type: number
    label: "Comisiones"
    sql: ${TABLE}.COMISIONES ;;
  }

  dimension: conexos {
    type: number
    label: "Conexos"
    sql: ${TABLE}.CONEXOS ;;
  }

  dimension: derechos {
    type: number
    label: "Derechos"
    sql: ${TABLE}.DERECHOS ;;
  }

  dimension: endoso {
    type: number
    label: "Endoso"
    sql: ${TABLE}.ENDOSO ;;
  }

  dimension: exhibicion {
    type: number
    label: "Exhibición"
    sql: ${TABLE}.EXHIBICION ;;
  }

  dimension_group: fecha_actualizacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha de Actualización"
    sql: ${TABLE}.FECHA_ACTUALIZACION ;;
  }

  dimension_group: fecha_fin_vigencia_exhibicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Fin Vigencia Exhibición"
    sql: ${TABLE}.FECHA_FIN_VIGENCIA_EXHIBICION ;;
  }

  dimension_group: fecha_fin_vigencia_recibo {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Fin Vigencia Recibo"
    sql: ${TABLE}.FECHA_FIN_VIGENCIA_RECIBO ;;
  }

  dimension_group: fecha_inicio_vigencia_exhibicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Inicio Vigencia Exhibición"
    sql: ${TABLE}.FECHA_INICIO_VIGENCIA_EXHIBICION ;;
  }

  dimension_group: fecha_inicio_vigencia_recibo {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Inicio Vigencia Recibo"
    sql: ${TABLE}.FECHA_INICIO_VIGENCIA_RECIBO ;;
  }

  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: timestamp
    label: "Fecha de Pago"
    sql: TIMESTAMP(${TABLE}.FECHA_PAGO) ;;
  }

  dimension: id_moneda {
    type: number
    label: "ID Moneda"
    sql: ${TABLE}.ID_MONEDA ;;
  }

  dimension: id_origen {
    type: number
    label: "ID Origen"
    sql: ${TABLE}.ID_ORIGEN ;;
  }

  dimension: id_riesgo_contable {
    type: number
    label: "ID Riesgo Contable"
    sql: ${TABLE}.ID_RIESGO_CONTABLE ;;
  }

  dimension: id_tipo_transaccion {
    type: number
    label: "ID Tipo Transacción"
    sql: ${TABLE}.ID_TIPO_TRANSACCION ;;
  }

  dimension: iva {
    type: number
    label: "IVA"
    sql: ${TABLE}.IVA ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Última Actualización"
    sql: ${TABLE}.LAST_UPDATE ;;
  }

  dimension: poliza {
    type: string
    label: "Póliza"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: prima_directa {
    type: number
    label: "Prima Directa Pagada"
    sql: ${TABLE}.PRIMA_DIRECTA ;;
    value_format: "$#,##0"
  }

  dimension: prima_total {
    type: number
    label: "Prima Total Pagada"
    sql: ${TABLE}.PRIMA_TOTAL ;;
    value_format: "$#,##0"
  }

  dimension: recargos {
    type: number
    label: "Recargos"
    sql: ${TABLE}.RECARGOS ;;
  }

  dimension: recibo {
    type: string
    label: "Recibo"
    sql: ${TABLE}.RECIBO ;;
  }

  dimension_group: snapshot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Snapshot"
    sql: ${TABLE}.SNAPSHOT_DATE ;;
  }

  dimension: usuario_actualizacion {
    type: string
    label: "Usuario Actualización"
    sql: ${TABLE}.USUARIO_ACTUALIZACION ;;
  }

  measure: count {
    type: count
    label: "Total Pagos Registrados"
    value_format_name: decimal_0
  }

  measure: monto_total_pagado {
    type: sum
    label: "Monto Total Pagado"
    sql: ${prima_total} ;;
    value_format: "$#,##0"
  }
}
