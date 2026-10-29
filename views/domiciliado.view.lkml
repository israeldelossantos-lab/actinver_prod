view: domiciliado {
  sql_table_name: `@{dataset_actinver}.DOMICILIADO` ;;

  dimension: poliza {
    primary_key: yes
    type: string
    label: "Póliza Domiciliada"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: es_domiciliada {
    type: yesno
    label: "Es Domiciliada (D)"
    sql: ${TABLE}.DOMICILIADO = 'D' ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Registros Domiciliación"
  }

  measure: polizas_domiciliadas_count {
    type: count_distinct
    label: "Pólizas Domiciliadas"
    sql: ${poliza} ;;
    filters: [es_domiciliada: "yes"]
    value_format_name: decimal_0
  }
}
