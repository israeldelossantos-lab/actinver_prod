view: tipo_transaccion {
  sql_table_name: `@{dataset_actinver}.TIPO_TRANSACCION` ;;

  dimension: id_tipo_transaccion {
    primary_key: yes
    type: number
    label: "ID Tipo Transacción"
    sql: ${TABLE}.ID_TIPO_TRANSACCION ;;
  }

  dimension: tipo_transaccion {
    type: string
    label: "Tipo de Transacción"
    sql: ${TABLE}.TIPO_TRANSACCION ;;
  }

  dimension: subtipo_transaccion {
    type: string
    label: "Subtipo de Transacción"
    sql: ${TABLE}.SUBTIPO_TRANSACCION ;;
  }

  dimension: tipo_cancelacion {
    type: string
    label: "Tipo de Cancelación"
    sql: ${TABLE}.TIPO_CANCELACION ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Tipos Transacción"
  }
}
