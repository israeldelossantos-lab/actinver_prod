view: cattipocontrato {
  sql_table_name: `@{dataset_actinver}.cattipocontrato` ;;

  dimension: id_tipo_contrato {
    primary_key: yes
    type: number
    label: "ID Tipo Contrato"
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
