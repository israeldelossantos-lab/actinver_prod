view: cliente {
  sql_table_name: `@{dataset_actinver}.cliente` ;;

  dimension: id_cliente_num {
    primary_key: yes
    type: number
    label: "ID de Cliente (Numérico)"
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: id_cliente {
    type: number
    label: "ID de Cliente"
    sql: ${TABLE}.id_cliente ;;
  }

  dimension: id_persona {
    type: number
    label: "ID Persona"
    sql: ${TABLE}.id_persona ;;
  }

  dimension: id_asesor {
    type: string
    label: "ID Asesor"
    sql: ${TABLE}.id_asesor ;;
  }

  dimension: autorizacion_consulta_buro {
    type: yesno
    label: "KYC: Autorización Consulta Buró"
    sql: ${TABLE}.autorizacion_consulta_buro ;;
  }

  dimension: biometrico_facial {
    type: yesno
    label: "KYC: Biométrico Facial"
    sql: ${TABLE}.biometrico_facial ;;
  }

  dimension: carta_manifiesto {
    type: yesno
    label: "KYC: Carta Manifiesto"
    sql: ${TABLE}.carta_manifiesto ;;
  }

  dimension: cliente_seguro {
    type: yesno
    label: "Cliente Seguro"
    sql: ${TABLE}.cliente_seguro ;;
  }

  dimension_group: fecha_hora_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha de Alta de Cliente"
    sql: ${TABLE}.fecha_hora_creacion ;;
  }

  dimension_group: fecha_vencimiento_fiel {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "KYC: Vencimiento FIEL"
    sql: ${TABLE}.fecha_vencimiento_fiel ;;
  }

  dimension: fiel_vigente {
    type: yesno
    label: "KYC: FIEL Vigente"
    sql: ${TABLE}.fecha_vencimiento_fiel >= CURRENT_DATETIME() ;;
  }

  dimension: id_estatus_cliente {
    type: number
    label: "Estatus de Cliente [VALIDAR catálogo]"
    sql: ${TABLE}.id_estatus_cliente ;;
  }

  dimension: id_estatus_enrolamiento {
    type: string
    label: "Estatus de Enrolamiento"
    sql: ${TABLE}.id_estatus_enrolamiento ;;
  }

  dimension: id_tipo_persona {
    type: number
    label: "Tipo de Persona (1=Física, 2=Moral)"
    sql: ${TABLE}.id_tipo_persona ;;
  }

  dimension: tipo_persona_desc {
    type: string
    label: "Persona Física vs Moral"
    sql: CASE WHEN ${TABLE}.id_tipo_persona = 1 THEN 'Persona Física' ELSE 'Persona Moral' END ;;
  }

  dimension: riesgo_mod {
    type: number
    label: "Grado de Riesgo [VALIDAR: perfil inversión vs PLD]"
    sql: ${TABLE}.riesgo_mod ;;
  }

  dimension: segmento_awm {
    type: yesno
    label: "Segmento AWM (Patrimonial)"
    sql: ${TABLE}.segmento_awm ;;
  }

  measure: count {
    type: count
    label: "Total Clientes"
    value_format_name: decimal_0
  }

  measure: clientes_patrimoniales_awm {
    type: count
    label: "Clientes AWM Patrimonial"
    filters: [segmento_awm: "yes"]
    value_format_name: decimal_0
  }

  measure: clientes_con_biometrico {
    type: count
    label: "Clientes con Biométrico Facial"
    filters: [biometrico_facial: "yes"]
    value_format_name: decimal_0
  }

  measure: pct_cumplimiento_biometrico {
    type: number
    label: "% Cumplimiento Biométrico"
    sql: 1.0 * ${clientes_con_biometrico} / NULLIF(${count}, 0) ;;
    value_format: "0.0%"
  }
}
