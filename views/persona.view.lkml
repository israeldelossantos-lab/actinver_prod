view: persona {
  sql_table_name: `@{dataset_spine}.persona` ;;

  dimension: id_persona {
    primary_key: yes
    type: number
    label: "ID Persona"
    sql: ${TABLE}.id_persona ;;
  }

  dimension: id_tipo_persona {
    type: number
    label: "ID Tipo Persona"
    sql: ${TABLE}.id_tipo_persona ;;
  }

  dimension: id_tipo_genero {
    type: string
    label: "Género"
    sql: ${TABLE}.id_tipo_genero ;;
  }

  dimension: id_estado_civil {
    type: string
    label: "Estado Civil"
    sql: ${TABLE}.id_estado_civil ;;
  }

  dimension: id_pais_nacimiento {
    type: string
    label: "País Nacimiento"
    sql: ${TABLE}.id_pais_nacimiento ;;
  }

  dimension: id_estado_nacimiento {
    type: string
    label: "Estado Nacimiento"
    sql: ${TABLE}.id_estado_nacimiento ;;
  }

  dimension: id_ciudad_nacimiento {
    type: string
    label: "Ciudad Nacimiento"
    sql: ${TABLE}.id_ciudad_nacimiento ;;
  }

  dimension: id_tipo_ocupacion {
    type: string
    label: "Ocupación"
    sql: ${TABLE}.id_tipo_ocupacion ;;
  }

  dimension: empleado_actinver {
    type: yesno
    label: "Empleado Actinver"
    sql: ${TABLE}.empleado_actinver ;;
  }

  dimension: asalariado {
    type: yesno
    label: "Asalariado"
    sql: ${TABLE}.asalariado ;;
  }

  dimension: pfae {
    type: yesno
    label: "PFAE"
    sql: ${TABLE}.pfae ;;
  }

  measure: count {
    type: count
    label: "Total Personas"
  }
}
