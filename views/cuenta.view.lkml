view: cuenta {
  sql_table_name: `@{dataset_actinver}.cuenta` ;;

  dimension: id_cuenta {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_cuenta ;;
  }

  dimension: asesor_independiente {
    type: string
    sql: ${TABLE}.asesor_independiente ;;
  }

  dimension: cuenta_flex {
    type: string
    sql: ${TABLE}.cuenta_flex ;;
  }

  dimension_group: fecha_apertura {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.fecha_apertura ;;
  }

  dimension_group: fecha_hora_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.fecha_hora_creacion ;;
  }

  dimension: id_asesor {
    type: string
    sql: ${TABLE}.id_asesor ;;
  }

  dimension: id_centro_financiero {
    type: string
    sql: ${TABLE}.id_centro_financiero ;;
  }

  dimension: id_cliente {
    type: number
    sql: ${TABLE}.id_cliente ;;
  }

  dimension: id_canal_originacion {
    type: number
    sql: ${TABLE}.id_tipo_canal_originacion ;;
  }

  dimension: id_tipo_contrato {
    type: number
    sql: ${TABLE}.id_tipo_contrato ;;
  }

  dimension: id_tipo_area_bancaria {
    type: number
    sql: ${TABLE}.id_tipo_area_bancaria ;;
  }

  dimension: tipo_entidad_bancaria {
    type: string
    label: "Entidad Financiera (Banco vs Casa de Bolsa)"
    sql: CASE 
      WHEN ${TABLE}.id_tipo_area_bancaria = 999 THEN 'Banco'
      WHEN ${TABLE}.id_tipo_area_bancaria = 998 THEN 'Casa de Bolsa'
      ELSE 'Otra Entidad'
    END ;;
  }

  dimension: id_estatus_cuenta {
    type: string
    label: "Estatus de Cuenta [VALIDAR catálogo]"
    sql: ${TABLE}.id_estatus_cuenta ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }

  dimension: riesgo_inicial {
    type: number
    sql: ${TABLE}.riesgo_inicial ;;
  }

  dimension: riesgo_mod {
    type: number
    label: "Riesgo Modificado [VALIDAR: perfil inversión vs PLD]"
    sql: ${TABLE}.riesgo_mod ;;
  }

  measure: count {
    type: count
    label: "Total Cuentas"
  }
}
