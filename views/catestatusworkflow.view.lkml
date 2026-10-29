view: catestatusworkflow {
  sql_table_name: `actinver_qa.catestatusworkflow` ;;

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
  dimension: estatus_workflow {
    type: string
    sql: ${TABLE}.estatus_workflow ;;
  }
  dimension: id_estatus_workflow {
    type: number
    sql: ${TABLE}.id_estatus_workflow ;;
  }
  dimension_group: modificado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.modificado ;;
  }
  measure: count {
    type: count
  }
}
