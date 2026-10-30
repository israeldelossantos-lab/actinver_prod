view: catcanaloriginacion {
  sql_table_name: `@{dataset_spine}.catcanaloriginacion` ;;

  dimension: id_tipo_canal_originacion {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_tipo_canal_originacion ;;
  }

  dimension: id_tipo_canal_originacion_cve {
    type: string
    label: "Clave Canal Originación"
    sql: ${TABLE}.id_tipo_canal_originacion_cve ;;
  }

  dimension: canal_originacion {
    type: string
    label: "Canal de Originación"
    sql: ${TABLE}.canal_originacion ;;
  }

  dimension: activo {
    type: yesno
    sql: ${TABLE}.activo ;;
  }

  measure: count {
    type: count
    label: "Total Canales"
  }
}
