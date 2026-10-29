view: persona {
  sql_table_name: `@{dataset_actinver}.persona` ;;

  dimension: id_persona {
    primary_key: yes
    type: number
    label: "ID Persona"
    sql: ${TABLE}.id_persona ;;
  }

  dimension: asalariado {
    type: yesno
    label: "Es Asalariado"
    sql: ${TABLE}.asalariado ;;
  }

  dimension: empleado_actinver {
    type: yesno
    label: "Es Empleado Actinver"
    sql: ${TABLE}.empleado_actinver ;;
  }

  dimension: id_estado_nacimiento {
    type: string
    label: "Estado de Nacimiento [NOTA: No usar como residencia]"
    description: "Estado de nacimiento del cliente. Para geografía use el centro financiero o sucursal."
    sql: ${TABLE}.id_estado_nacimiento ;;
  }

  dimension: id_rango_inversion {
    type: string
    label: "Rango de Inversión Declarado"
    sql: ${TABLE}.id_rango_inversion ;;
  }

  dimension: id_tipo_genero {
    type: string
    label: "Género"
    sql: ${TABLE}.id_tipo_genero ;;
  }

  dimension: id_tipo_ocupacion {
    type: string
    label: "Ocupación"
    sql: ${TABLE}.id_tipo_ocupacion ;;
  }

  measure: count {
    type: count
    label: "Total Personas"
    value_format_name: decimal_0
  }
}
