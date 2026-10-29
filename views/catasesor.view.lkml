view: catasesor {
  sql_table_name: `@{dataset_actinver}.catasesor` ;;

  dimension: id_asesor_cve {
    primary_key: yes
    type: string
    label: "Clave Asesor"
    sql: ${TABLE}.id_asesor_cve ;;
  }

  dimension: id_asesor {
    type: number
    sql: ${TABLE}.id_asesor ;;
  }

  dimension: id_centro_financiero {
    type: string
    label: "Clave Centro Financiero"
    sql: ${TABLE}.id_centro_financiero ;;
  }

  dimension: asesor_etiqueta {
    type: string
    label: "Asesor"
    sql: CASE WHEN ${TABLE}.id_asesor_cve = '00999' OR ${TABLE}.id_asesor_cve = '999' THEN 'Sin Asesor Asignado' ELSE CONCAT('Asesor ', ${TABLE}.id_asesor_cve) END ;;
  }

  dimension: activo {
    type: yesno
    label: "Asesor Activo"
    sql: ${TABLE}.activo ;;
  }

  dimension: es_virtual {
    type: yesno
    label: "Asistente Virtual"
    sql: ${TABLE}.es_virtual ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo Asesor"
    sql: ${TABLE}.grupo ;;
  }

  dimension: segmento {
    type: string
    label: "Segmento Asesor"
    sql: ${TABLE}.segmento ;;
  }

  measure: count {
    type: count
    label: "Total Asesores"
    value_format_name: decimal_0
  }

  measure: asesores_activos {
    type: count
    label: "Asesores Activos"
    filters: [activo: "yes"]
    value_format_name: decimal_0
  }
}
