view: catestatusworkflow {
  sql_table_name: `@{dataset_spine}.catestatusworkflow` ;;

  dimension: activo {
    type: yesno
    sql: ${TABLE}.activo ;;
  }

  dimension: estatus_workflow {
    type: string
    sql: ${TABLE}.estatus_workflow ;;
  }

  dimension: id_estatus_workflow {
    type: number
    sql: ${TABLE}.id_estatus_workflow ;;
  }
  measure: count {
    type: count
  }
}
