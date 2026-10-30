view: cliente {
  sql_table_name: `@{dataset_spine}.cliente` ;;

  dimension: id_cliente_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: id_cliente_num {
    type: number
    label: "ID de Cliente (Numérico)"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.id_cliente_num ;;
    link: {
      label: "Ver ficha del cliente"
      url: "/dashboards/actinver::ficha_cliente?Cliente={{ value }}"
    }
  }

  dimension: id_cliente {
    type: number
    label: "ID de Cliente"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.id_cliente ;;
  }

  dimension: cliente_ref {
    type: string
    label: "Referencia Cliente"
    description: "Identificador anonimizado de cliente para visualizaciones públicas"
    sql: CONCAT('***', SUBSTR(CAST(${TABLE}.id_cliente_num AS STRING), -4)) ;;
  }

  dimension: id_persona {
    type: number
    label: "ID Persona"
    sql: ${TABLE}.id_persona ;;
  }

  dimension: url_image {
    type: string
    label: "URL Imagen"
    description: "URL de la foto de perfil del cliente (RandomUser API)"
    sql: ${TABLE}.url_image ;;
    html: <img src="{{ value }}" width="36" height="36" style="border-radius: 50%; object-fit: cover;" /> ;;
  }

  dimension: foto {
    type: string
    label: "Foto"
    description: "Avatar circular para tablas y fichas"
    sql: ${TABLE}.url_image ;;
    html: <img src="{{ value }}" style="width:40px;height:40px;border-radius:50%;object-fit:cover;"> ;;
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

  measure: clientes_con_seguro {
    type: count
    label: "Clientes con Seguro"
    filters: [cliente_seguro: "yes"]
    value_format_name: decimal_0
  }

  measure: pct_clientes_con_seguro {
    type: number
    label: "% Clientes con Seguro"
    sql: 1.0 * ${clientes_con_seguro} / NULLIF(${count}, 0) ;;
    value_format: "0.0%"
  }

  measure: clientes_con_biometrico {
    type: count
    label: "Clientes con Biométrico Facial"
    filters: [biometrico_facial: "yes"]
    value_format_name: decimal_0
    hidden: yes
  }

  measure: pct_cumplimiento_biometrico {
    type: number
    label: "% Cumplimiento Biométrico"
    sql: 1.0 * ${clientes_con_biometrico} / NULLIF(${count}, 0) ;;
    value_format: "0.0%"
    hidden: yes
  }
}
