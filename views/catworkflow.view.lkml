view: catworkflow {
  sql_table_name: `actinver_qa.catworkflow` ;;

  dimension: activo {
    type: yesno
    sql: ${TABLE}.activo ;;
  }
  dimension_group: creado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.creado ;;
  }
  dimension: id_workflow {
    type: number
    sql: ${TABLE}.id_workflow ;;
  }
  dimension_group: modificado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.modificado ;;
  }
  dimension: workflow {
    type: string
    sql: ${TABLE}.workflow ;;
  }
  measure: count {
    type: count
  }
}
