view: polizas {
  sql_table_name: `@{dataset_actinver}.POLIZAS` ;;

  dimension: poliza_riesgo_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.POLIZA, '_', CAST(${TABLE}.ID_RIESGO_CONTABLE AS STRING)) ;;
  }

  dimension: poliza {
    type: string
    label: "Póliza"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: poliza_anterior {
    type: string
    label: "Póliza Anterior"
    sql: ${TABLE}.POLIZA_ANTERIOR ;;
  }

  dimension: es_renovacion {
    type: yesno
    label: "Es Renovación"
    sql: (${TABLE}.POLIZA_ANTERIOR IS NOT NULL AND ${TABLE}.POLIZA_ANTERIOR != '') OR ${TABLE}.ID_TIPO_TRANSACCION = 2 ;;
  }

  dimension: baja_logica {
    type: number
    label: "Baja Lógica"
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  dimension: edad {
    type: number
    label: "Edad del Asegurado"
    sql: ${TABLE}.EDAD ;;
  }

  dimension_group: fecha_emision {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha de Emisión"
    sql: ${TABLE}.FECHA_EMISION ;;
  }

  dimension_group: fecha_inicio_vigencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Inicio Vigencia"
    sql: ${TABLE}.FECHA_INICIO_VIGENCIA ;;
  }

  dimension_group: fecha_fin_vigencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Fin Vigencia"
    sql: ${TABLE}.FECHA_FIN_VIGENCIA ;;
  }

  dimension: id_canal_venta {
    type: string
    label: "ID Canal Venta"
    sql: ${TABLE}.ID_CANAL_VENTA ;;
  }

  dimension: id_numero_relacion {
    type: number
    label: "ID Número Relación [VALIDAR: id_cliente]"
    description: "Llave de cruce potencial con cliente.id_cliente_num (~70% cruce)"
    sql: ${TABLE}.ID_NUMERO_RELACION ;;
  }

  dimension: id_producto {
    type: number
    label: "ID Producto"
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: id_tipo_poliza {
    type: number
    label: "ID Tipo Póliza"
    sql: ${TABLE}.ID_TIPO_POLIZA ;;
  }

  dimension: id_tipo_transaccion {
    type: number
    label: "ID Tipo Transacción"
    sql: ${TABLE}.ID_TIPO_TRANSACCION ;;
  }

  dimension: id_via_pago {
    type: number
    label: "ID Vía Pago"
    sql: ${TABLE}.ID_VIA_PAGO ;;
  }

  dimension: id_origen {
    type: number
    label: "ID Origen"
    sql: ${TABLE}.ID_ORIGEN ;;
  }

  dimension: id_localidad {
    type: number
    label: "ID Localidad [VALIDAR: Clave INEGI]"
    sql: ${TABLE}.ID_LOCALIDAD ;;
  }

  dimension: id_riesgo_contable {
    type: number
    label: "ID Riesgo Contable"
    sql: ${TABLE}.ID_RIESGO_CONTABLE ;;
  }

  measure: count {
    type: count
    label: "Total Registros Riesgo Contable"
  }

  measure: count_polizas {
    type: count_distinct
    label: "Total Pólizas Únicas"
    sql: ${poliza} ;;
    value_format_name: decimal_0
  }

  measure: polizas_renovacion {
    type: count_distinct
    label: "Pólizas Renovadas"
    sql: ${poliza} ;;
    filters: [es_renovacion: "yes"]
    value_format_name: decimal_0
  }

  measure: polizas_nuevo_negocio {
    type: count_distinct
    label: "Pólizas Nuevo Negocio"
    sql: ${poliza} ;;
    filters: [es_renovacion: "no"]
    value_format_name: decimal_0
  }

  measure: pct_renovacion {
    type: number
    label: "% Pólizas Renovadas"
    sql: 1.0 * ${polizas_renovacion} / NULLIF(${count_polizas}, 0) ;;
    value_format: "0.0%"
  }
}
