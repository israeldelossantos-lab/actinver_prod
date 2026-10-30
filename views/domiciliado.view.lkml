view: domiciliado {
  sql_table_name: `@{dataset_seguros}.DOMICILIADO` ;;

  dimension: poliza {
    primary_key: yes
    type: string
    label: "Póliza Domiciliada"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  dimension: es_domiciliado {
    type: yesno
    label: "Pago Domiciliado"
    sql: ${TABLE}.POLIZA IS NOT NULL ;;
  }

  dimension: es_domiciliada {
    type: yesno
    label: "Pago Domiciliado (Femenino)"
    sql: ${TABLE}.POLIZA IS NOT NULL ;;
  }

  measure: total_domiciliadas {
    type: count
    label: "Total Pólizas Domiciliadas"
    value_format_name: decimal_0
  }
}
