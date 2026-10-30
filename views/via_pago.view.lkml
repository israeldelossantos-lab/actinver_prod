view: via_pago {
  sql_table_name: `@{dataset_seguros}.VIA_PAGO` ;;

  dimension: id_via_pago {
    primary_key: yes
    type: number
    label: "ID Vía de Pago"
    sql: ${TABLE}.ID_VIA_PAGO ;;
  }

  dimension: via_pago {
    type: string
    label: "Vía de Pago"
    sql: ${TABLE}.VIA_PAGO ;;
  }

  measure: count {
    type: count
    label: "Total Vías Pago"
  }
}
