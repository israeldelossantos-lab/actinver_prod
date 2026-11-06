# Vista de Mercado de Seguros por Ramo Anual (CNSF)
# Fuente: contexto_externo.v_cnsf_mercado_ramo_anual
view: ctx_cnsf_mercado_ramo {
  sql_table_name: `@{dataset_contexto}.v_cnsf_mercado_ramo_anual` ;;
  label: "Mercado Seguros: Ramos (CNSF)"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.anio AS STRING), '-', ${TABLE}.ramo_normalizado) ;;
  }

  dimension: anio {
    type: number
    label: "Año"
    sql: ${TABLE}.anio ;;
    value_format_name: id
  }

  dimension: ramo_normalizado {
    type: string
    label: "Ramo Normalizado"
    description: "Nombre normalizado y homologado del ramo según CNSF"
    sql: ${TABLE}.ramo_normalizado ;;
  }

  dimension: operacion {
    type: string
    label: "Operación de Seguro"
    description: "Operación principal: Vida, Autos, Daños, Accidentes y Enfermedades, etc."
    sql: ${TABLE}.operacion ;;
  }

  dimension: orden {
    type: number
    hidden: yes
    sql: ${TABLE}.orden ;;
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: total_prima_emitida {
    type: sum
    label: "Prima Emitida Mercado"
    description: "Prima directa total emitida por el mercado asegurador mexicano"
    sql: ${TABLE}.prima_emitida ;;
    value_format_name: usd_0
    group_label: "Primas Mercado"
  }

  measure: total_polizas_vigor {
    type: sum
    label: "Pólizas en Vigor Mercado"
    description: "Número total de pólizas vigentes a nivel sectorial"
    sql: ${TABLE}.numero_polizas_vigor ;;
    value_format_name: decimal_0
    group_label: "Volumen Mercado"
  }

  measure: total_certificados_vigor {
    type: sum
    label: "Certificados en Vigor Mercado"
    sql: ${TABLE}.numero_certificados_vigor ;;
    value_format_name: decimal_0
    group_label: "Volumen Mercado"
  }

  measure: total_suma_asegurada {
    type: sum
    label: "Suma Asegurada Total Mercado"
    sql: ${TABLE}.suma_asegurada ;;
    value_format_name: usd_0
    group_label: "Primas Mercado"
  }

  measure: total_siniestros {
    type: sum
    label: "Siniestros Totales Mercado"
    sql: ${TABLE}.numero_siniestros ;;
    value_format_name: decimal_0
    group_label: "Siniestralidad"
  }

  measure: total_costo_siniestros {
    type: sum
    label: "Costo Siniestros Mercado"
    sql: ${TABLE}.costo_siniestros ;;
    value_format_name: usd_0
    group_label: "Siniestralidad"
  }

  measure: siniestralidad_pct {
    type: number
    label: "Siniestralidad Ponderada %"
    description: "Costo de siniestros entre prima emitida a nivel mercado"
    sql: SAFE_DIVIDE(${total_costo_siniestros}, ${total_prima_emitida}) * 100.0 ;;
    value_format: "0.0\"%\""
    group_label: "Ratios Técnicos"
  }

  measure: prima_promedio_poliza {
    type: number
    label: "Prima Promedio por Póliza"
    sql: SAFE_DIVIDE(${total_prima_emitida}, ${total_polizas_vigor}) ;;
    value_format_name: usd_0
    group_label: "Ratios Técnicos"
  }

  measure: costo_promedio_siniestro {
    type: number
    label: "Costo Promedio por Siniestro"
    sql: SAFE_DIVIDE(${total_costo_siniestros}, ${total_siniestros}) ;;
    value_format_name: usd_0
    group_label: "Ratios Técnicos"
  }
}
