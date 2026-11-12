# SINTÉTICO: pagarés bursátiles, CEDEs y PRLV con vencimiento. Fechas relativas a hoy (vista v_vencimiento_inversion).
view: vencimiento_inversion {
  sql_table_name: `@{dataset_copiloto}.v_vencimiento_inversion` ;;
  label: "Copiloto: vencimientos de inversión (demo)"

  dimension: id_instrumento {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id_instrumento ;;
  }

  dimension: id_cliente_num {
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: instrumento {
    type: string
    label: "Instrumento"
    sql: ${TABLE}.instrumento ;;
  }

  dimension: monto_mxn {
    type: number
    label: "Monto (MXN)"
    sql: ${TABLE}.monto_mxn ;;
    value_format: "$#,##0"
  }

  dimension: plazo_dias {
    type: number
    label: "Plazo (días)"
    sql: ${TABLE}.plazo_dias ;;
  }

  dimension: tasa_pactada_anual {
    type: number
    label: "Tasa pactada anual (%)"
    description: "SINTÉTICO: CETES 28 de referencia + diferencial. Nulo si no se cargó la referencia"
    sql: ${TABLE}.tasa_pactada_anual ;;
    value_format: "0.00\"%\""
  }

  dimension: renovacion_automatica {
    type: yesno
    label: "Renovación automática"
    sql: ${TABLE}.renovacion_automatica ;;
  }

  dimension: dias_para_vencer {
    type: number
    label: "Días para vencer"
    sql: ${TABLE}.dias_para_vencer ;;
  }

  dimension: ventana {
    type: string
    label: "Ventana de vencimiento"
    sql: CASE WHEN ${dias_para_vencer} <= 7 THEN '1. Esta semana (0-7 días)'
              WHEN ${dias_para_vencer} <= 30 THEN '2. Próximos 30 días'
              WHEN ${dias_para_vencer} <= 90 THEN '3. Próximos 90 días'
              ELSE '4. Más de 90 días' END ;;
  }

  dimension_group: vencimiento {
    type: time
    timeframes: [date, week, month]
    datatype: date
    label: "Vencimiento"
    sql: ${TABLE}.fecha_vencimiento ;;
  }

  dimension_group: inicio {
    type: time
    timeframes: [date, month]
    datatype: date
    label: "Inicio"
    sql: ${TABLE}.fecha_inicio ;;
  }

  measure: instrumentos {
    type: count
    label: "Instrumentos"
    value_format_name: decimal_0
  }

  measure: monto_total {
    type: sum
    label: "Monto que vence"
    sql: ${monto_mxn} ;;
    value_format: "[>=1000000]$0.0,,\" M\";$#,##0"
  }

  measure: monto_vence_7d {
    type: sum
    label: "Monto que vence esta semana"
    sql: ${monto_mxn} ;;
    filters: [dias_para_vencer: "<=7"]
    value_format: "[>=1000000]$0.0,,\" M\";$#,##0"
  }

  measure: monto_vence_30d {
    type: sum
    label: "Monto que vence en 30 días"
    sql: ${monto_mxn} ;;
    filters: [dias_para_vencer: "<=30"]
    value_format: "[>=1000000]$0.0,,\" M\";$#,##0"
  }
}
