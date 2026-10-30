view: polizas {
  sql_table_name: `@{dataset_seguros}.POLIZAS` ;;

  dimension: poliza_riesgo_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.POLIZA, '_', CAST(${TABLE}.ID_RIESGO_CONTABLE AS STRING)) ;;
  }

  dimension: poliza_key {
    hidden: yes
    type: string
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: poliza {
    type: string
    label: "Póliza"
    sql: ${TABLE}.POLIZA ;;
    required_access_grants: [ver_pii]
  }

  dimension: poliza_ref {
    type: string
    label: "Póliza (Enmascarada)"
    description: "Identificador enmascarado visible para todos los usuarios"
    sql: CONCAT('***', SUBSTR(CAST(${TABLE}.POLIZA AS STRING), -4)) ;;
  }

  dimension: poliza_anterior {
    type: string
    label: "Póliza Anterior"
    sql: ${TABLE}.POLIZA_ANTERIOR ;;
    required_access_grants: [ver_pii]
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
    sql: ${TABLE}.POLIZA ;;
    value_format_name: decimal_0
  }
}
