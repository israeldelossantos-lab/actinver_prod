# SINTÉTICO: nombre para mostrar por asesor (dataset demo_copiloto).
view: asesor_nombre_demo {
  sql_table_name: `@{dataset_copiloto}.asesor_nombre_demo` ;;
  label: "Copiloto: asesor (demo)"

  dimension: id_asesor_cve {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id_asesor_cve ;;
  }

  dimension: nombre_mostrar {
    type: string
    label: "Nombre del asesor"
    description: "SINTÉTICO. Para el saludo de la app (\"Buenos días, ...\")"
    sql: ${TABLE}.nombre_mostrar ;;
  }

  dimension: nombre {
    type: string
    label: "Nombre de pila del asesor"
    description: "SINTÉTICO"
    sql: ${TABLE}.nombre ;;
  }
}
