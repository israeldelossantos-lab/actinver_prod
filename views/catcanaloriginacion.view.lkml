view: catcanaloriginacion {
  sql_table_name: `@{dataset_actinver}.catcanaloriginacion` ;;

  dimension: id_tipo_canal_originacion {
    primary_key: yes
    type: number
    label: "ID Canal Originación"
    sql: ${TABLE}.id_tipo_canal_originacion ;;
  }

  dimension: canal_originacion {
    type: string
    label: "Canal de Originación"
    description: "Canal de alta: DINN, Actinver Digital, Trade, Salesforce, Asistente Virtual, etc."
    sql: ${TABLE}.canal_originacion ;;
  }

  dimension: es_digital {
    type: yesno
    label: "Es Canal Digital (DINN / Digital / Trade)"
    sql: UPPER(${canal_originacion}) LIKE '%DIGITAL%' OR UPPER(${canal_originacion}) LIKE '%DINN%' OR UPPER(${canal_originacion}) LIKE '%TRADE%' ;;
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
