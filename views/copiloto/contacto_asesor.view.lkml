# SINTÉTICO: historial de contactos asesor-cliente. Fechas relativas a hoy (vista v_contacto_asesor).
view: contacto_asesor {
  sql_table_name: `@{dataset_copiloto}.v_contacto_asesor` ;;
  label: "Copiloto: contactos (demo)"

  dimension: id_contacto {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id_contacto ;;
  }

  dimension: id_cliente_num {
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: canal {
    type: string
    label: "Canal"
    sql: ${TABLE}.canal ;;
  }

  dimension: motivo {
    type: string
    label: "Motivo"
    sql: ${TABLE}.motivo ;;
  }

  dimension: resultado {
    type: string
    label: "Resultado"
    sql: ${TABLE}.resultado ;;
  }

  dimension_group: contacto {
    type: time
    timeframes: [date, week, month]
    datatype: date
    label: "Contacto"
    sql: ${TABLE}.fecha_contacto ;;
  }

  measure: contactos {
    type: count
    label: "Contactos"
    value_format_name: decimal_0
  }
}

# Último contacto por cliente (para "hace N días" y avisos de clientes desatendidos)
view: dt_ultimo_contacto {
  derived_table: {
    sql:
      SELECT id_cliente_num,
             MAX(fecha_contacto) AS ultimo_contacto,
             DATE_DIFF(CURRENT_DATE('America/Mexico_City'), MAX(fecha_contacto), DAY) AS dias_sin_contacto,
             COUNT(*) AS contactos_total
      FROM `@{dataset_copiloto}.v_contacto_asesor`
      GROUP BY id_cliente_num ;;
  }
  label: "Copiloto: último contacto (demo)"

  dimension: id_cliente_num {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: dias_sin_contacto {
    type: number
    label: "Días sin contacto"
    sql: ${TABLE}.dias_sin_contacto ;;
  }

  dimension_group: ultimo_contacto {
    type: time
    timeframes: [date]
    datatype: date
    label: "Último contacto"
    sql: ${TABLE}.ultimo_contacto ;;
  }

  dimension: contactos_total {
    type: number
    label: "Contactos registrados"
    sql: ${TABLE}.contactos_total ;;
  }
}
