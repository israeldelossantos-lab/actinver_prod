view: origen {
  sql_table_name: `@{dataset_seguros}.ORIGEN` ;;

  dimension: id_origen {
    primary_key: yes
    type: number
    label: "ID Origen"
    sql: ${TABLE}.ID_ORIGEN ;;
  }

  dimension: origen {
    type: string
    label: "Origen de Seguros"
    sql: ${TABLE}.ORIGEN ;;
  }

  measure: count {
    type: count
    label: "Total Orígenes"
  }
}
