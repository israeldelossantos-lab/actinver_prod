view: poliza_asesor {
  sql_table_name: `@{dataset_seguros}.POLIZA_ASESOR` ;;

  dimension: poliza {
    primary_key: yes
    type: string
    label: "Póliza Asignada"
    sql: ${TABLE}.POLIZA ;;
  }

  dimension: numero_asesor {
    type: string
    label: "Número de Asesor [VALIDAR: id_asesor_cve vs kardex]"
    sql: ${TABLE}.NUMERO_ASESOR ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Asignaciones Asesor"
  }
}
