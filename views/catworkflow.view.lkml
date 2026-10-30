view: catworkflow {
  sql_table_name: `@{dataset_spine}.catworkflow` ;;

  dimension: activo {
    type: yesno
    sql: ${TABLE}.activo ;;
  }

  dimension: id_workflow {
    type: number
    sql: ${TABLE}.id_workflow ;;
  }

  dimension: workflow {
    type: string
    sql: ${TABLE}.workflow ;;
  }
  measure: count {
    type: count
  }
}
