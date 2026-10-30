view: cattipocontrato {
  sql_table_name: `@{dataset_spine}.cattipocontrato` ;;

  dimension: id_tipo_contrato {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_tipo_contrato ;;
  }

  dimension: tipo_contrato {
    type: string
    label: "Tipo de Contrato"
    sql: ${TABLE}.tipo_contrato ;;
  }

  dimension: activo {
    type: yesno
    sql: ${TABLE}.activo ;;
  }

  measure: count {
    type: count
    label: "Total Tipos Contrato"
  }
}
