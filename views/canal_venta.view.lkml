view: canal_venta {
  sql_table_name: `@{dataset_seguros}.CANAL_VENTA` ;;

  dimension: id_canal_venta {
    primary_key: yes
    type: number
    label: "ID Canal Venta"
    sql: ${TABLE}.ID_CANAL_VENTA ;;
  }

  dimension: canal_venta {
    type: string
    label: "Canal de Venta Seguros"
    sql: ${TABLE}.CANAL_VENTA ;;
  }

  measure: count {
    type: count
    label: "Total Canales Venta"
  }
}
