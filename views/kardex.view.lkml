view: kardex {
  sql_table_name: `@{dataset_actinver}.KARDEX` ;;

  dimension: nomina {
    primary_key: yes
    type: string
    label: "Nómina Asesor [VALIDAR: id_asesor_cve]"
    sql: ${TABLE}.NOMINA ;;
  }

  dimension: puesto {
    type: string
    label: "Puesto"
    sql: ${TABLE}.PUESTO ;;
  }

  dimension: direccion_divisional {
    type: string
    label: "Dirección Divisional (Región Seguros)"
    sql: ${TABLE}.DIRECCION_DIVISIONAL ;;
  }

  dimension: departamento {
    type: string
    label: "Departamento"
    sql: ${TABLE}.DEPARTAMENTO ;;
  }

  dimension: comercial_seguros {
    type: string
    label: "Comercial Seguros"
    sql: ${TABLE}.COMERCIAL_SEGUROS ;;
  }

  dimension: segmento_seguros {
    type: string
    label: "Segmento Seguros"
    sql: ${TABLE}.SEGMENTO_SEGUROS ;;
  }

  measure: count {
    type: count
    label: "Total Colaboradores Kardex"
  }
}
