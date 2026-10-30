view: tipo_transaccion {
  sql_table_name: `@{dataset_seguros}.TIPO_TRANSACCION` ;;

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

  measure: count {
    type: count
    label: "Total Tipos Transacción"
  }
}
