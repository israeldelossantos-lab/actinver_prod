view: origen {
  sql_table_name: `@{dataset_actinver}.ORIGEN` ;;

  dimension: id_origen {
    primary_key: yes
    type: number
    label: "ID Origen"
    sql: ${TABLE}.ID_ORIGEN ;;
  }

  dimension: origen {
    type: string
    label: "Origen"
    sql: ${TABLE}.ORIGEN ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Orígenes"
  }
}
