# SINTÉTICO: nombre para mostrar por cliente (dataset demo_copiloto). Género coherente con la foto (url_image).
view: cliente_nombre_demo {
  sql_table_name: `@{dataset_copiloto}.cliente_nombre_demo` ;;
  label: "Copiloto: cliente (demo)"

  dimension: id_cliente_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: nombre_mostrar {
    type: string
    label: "Nombre del cliente"
    description: "SINTÉTICO. Nombre y primer apellido para mostrar en la app y en el avatar"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.nombre_mostrar ;;
  }

  dimension: nombre {
    type: string
    label: "Nombre de pila"
    description: "SINTÉTICO"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.nombre ;;
  }

  dimension: nombre_completo {
    type: string
    label: "Nombre completo"
    description: "SINTÉTICO"
    required_access_grants: [ver_pii]
    sql: CONCAT(${TABLE}.nombre, ' ', ${TABLE}.apellido_paterno, ' ', ${TABLE}.apellido_materno) ;;
  }

  dimension: genero_foto {
    type: string
    label: "Género (según foto)"
    sql: ${TABLE}.genero_foto ;;
  }

  dimension: es_sintetico {
    type: yesno
    label: "Es dato sintético"
    sql: ${TABLE}.es_sintetico ;;
  }
}
