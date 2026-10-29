view: poliza_asesor {
  sql_table_name: `@{dataset_actinver}.POLIZA_ASESOR` ;;

  dimension: poliza {
    primary_key: yes
    type: string
    label: "Póliza"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: numero_asesor {
    type: string
    label: "Número de Asesor (Póliza)"
    sql: ${TABLE}.NUMERO_ASESOR ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Asignaciones Póliza-Asesor"
  }
}
