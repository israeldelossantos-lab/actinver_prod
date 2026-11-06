# Vista de Ranking de Aseguradoras por Participación y Desempeño Financiero (CNSF)
# Fuente: contexto_externo.v_cnsf_ranking_aseguradoras
view: ctx_cnsf_ranking_aseguradoras {
  sql_table_name: `@{dataset_contexto}.v_cnsf_ranking_aseguradoras` ;;
  label: "Mercado Seguros: Aseguradoras (CNSF)"
  # Los montos de esta fuente vienen en millones de pesos

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.fecha AS STRING), '-', ${TABLE}.aseguradora) ;;
  }

  dimension_group: fecha_corte {
    type: time
    timeframes: [date, year]
    sql: ${TABLE}.fecha ;;
  }

  dimension: anio {
    type: number
    label: "Año"
    sql: ${TABLE}.anio ;;
    value_format_name: id
  }

  dimension: aseguradora {
    type: string
    label: "Aseguradora"
    description: "Razón social de la institución aseguradora"
    sql: ${TABLE}.aseguradora ;;
  }

  dimension: ranking_mercado {
    type: number
    label: "Posición en Ranking"
    sql: ${TABLE}.ranking_mercado ;;
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: total_prima_emitida {
    type: sum
    label: "Prima Emitida Total (millones de pesos)"
    sql: ${TABLE}.prima_emitida ;;
    value_format_name: usd_0
    group_label: "Primas"
  }

  measure: total_prima_directa {
    type: sum
    label: "Prima Directa (millones de pesos)"
    sql: ${TABLE}.prima_directa ;;
    value_format_name: usd_0
    group_label: "Primas"
  }

  measure: total_prima_tomada {
    type: sum
    label: "Prima Tomada (Reaseguro) (millones de pesos)"
    sql: ${TABLE}.prima_tomada ;;
    value_format_name: usd_0
    group_label: "Primas"
  }

  measure: total_costo_siniestralidad {
    type: sum
    label: "Costo de Siniestralidad (millones de pesos)"
    sql: ${TABLE}.costo_siniestralidad ;;
    value_format_name: usd_0
    group_label: "Costos Técnicos"
  }

  measure: total_costo_adquisicion {
    type: sum
    label: "Costo de Adquisición (millones de pesos)"
    sql: ${TABLE}.costo_adquisicion ;;
    value_format_name: usd_0
    group_label: "Costos Técnicos"
  }

  measure: total_utilidad_tecnica {
    type: sum
    label: "Utilidad Técnica (millones de pesos)"
    sql: ${TABLE}.utilidad_tecnica ;;
    value_format_name: usd_0
    group_label: "Resultados Financieros"
  }

  measure: total_utilidad_ejercicio {
    type: sum
    label: "Resultado Neto / Utilidad del Ejercicio (millones de pesos)"
    sql: ${TABLE}.utilidad_ejercicio ;;
    value_format_name: usd_0
    group_label: "Resultados Financieros"
  }

  measure: siniestralidad_ponderada_pct {
    type: number
    label: "Índice de Siniestralidad %"
    sql: SAFE_DIVIDE(${total_costo_siniestralidad}, ${total_prima_emitida}) * 100.0 ;;
    value_format: "0.0\"%\""
    group_label: "Ratios Técnicos"
  }

  measure: adquisicion_ponderada_pct {
    type: number
    label: "Índice de Adquisición %"
    sql: SAFE_DIVIDE(${total_costo_adquisicion}, ${total_prima_emitida}) * 100.0 ;;
    value_format: "0.0\"%\""
    group_label: "Ratios Técnicos"
  }
}
