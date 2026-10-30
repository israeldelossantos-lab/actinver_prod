view: tipo_poliza {
  sql_table_name: `@{dataset_seguros}.TIPO_POLIZA` ;;

  dimension: id_tipo_poliza {
    primary_key: yes
    type: number
    label: "ID Tipo Póliza"
    sql: ${TABLE}.ID_TIPO_POLIZA ;;
  }

  dimension: tipo_poliza {
    type: string
    label: "Tipo de Póliza"
    sql: ${TABLE}.TIPO_POLIZA ;;
  }

  measure: count {
    type: count
    label: "Total Tipos Póliza"
  }
}
