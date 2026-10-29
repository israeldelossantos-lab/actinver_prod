view: via_pago {
  sql_table_name: `@{dataset_actinver}.VIA_PAGO` ;;

  dimension: id_via_pago {
    primary_key: yes
    type: number
    label: "ID Vía Pago"
    sql: ${TABLE}.ID_VIA_PAGO ;;
  }

  dimension: via_pago {
    type: string
    label: "Vía de Pago"
    sql: ${TABLE}.VIA_PAGO ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Vías Pago"
  }
}
