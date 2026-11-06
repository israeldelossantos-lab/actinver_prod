# Vista de Mercado de Seguros por Entidad Federativa (CNSF)
# Fuente: contexto_externo.v_cnsf_mercado_entidad
view: ctx_cnsf_mercado_entidad {
  sql_table_name: `@{dataset_contexto}.v_cnsf_mercado_entidad` ;;
  label: "Mercado Seguros: Estatal (CNSF)"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.anio AS STRING), '-', ${TABLE}.clave_estado_inegi, '-', ${TABLE}.ramo_normalizado) ;;
  }

  dimension: anio {
    type: number
    label: "Año"
    sql: ${TABLE}.anio ;;
    value_format_name: id
  }

  dimension: entidad {
    type: string
    label: "Entidad Federativa"
    sql: ${TABLE}.entidad ;;
  }

  dimension: clave_estado_inegi {
    type: string
    label: "Clave INEGI Estado"
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: ramo_normalizado {
    type: string
    label: "Ramo Normalizado"
    sql: ${TABLE}.ramo_normalizado ;;
  }

  dimension: operacion {
    type: string
    label: "Operación de Seguro"
    sql: ${TABLE}.operacion ;;
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: total_prima_emitida {
    type: sum
    label: "Prima Emitida Estatal"
    description: "Prima directa emitida en el estado"
    sql: ${TABLE}.prima_emitida ;;
    value_format_name: usd_0
    group_label: "Primas Estatales"
  }

  measure: total_siniestros_ocurridos {
    type: sum
    label: "Siniestros Ocurridos"
    sql: ${TABLE}.siniestros_ocurridos ;;
    value_format_name: usd_0
    group_label: "Siniestros Estatales"
  }

  measure: total_siniestros_pagados {
    type: sum
    label: "Siniestros Pagados"
    sql: ${TABLE}.siniestros_pagados ;;
    value_format_name: usd_0
    group_label: "Siniestros Estatales"
  }

  measure: total_comision_directa {
    type: sum
    label: "Comisión Directa Pagada"
    description: "Monto total de comisiones pagadas a intermediarios en el estado"
    sql: ${TABLE}.comision_directa ;;
    value_format_name: usd_0
    group_label: "Comisiones y Distribución"
  }

  measure: siniestralidad_ponderada_pct {
    type: number
    label: "Siniestralidad Estatal %"
    description: "Siniestros ocurridos entre prima emitida estatal"
    sql: SAFE_DIVIDE(${total_siniestros_ocurridos}, ${total_prima_emitida}) * 100.0 ;;
    value_format: "0.0\"%\""
    group_label: "Ratios Estatales"
  }

  measure: pct_comision_directa {
    type: number
    label: "% Comisión Directa Promedio"
    description: "Comisiones entre prima emitida directa"
    sql: SAFE_DIVIDE(${total_comision_directa}, ${total_prima_emitida}) * 100.0 ;;
    value_format: "0.0\"%\""
    group_label: "Ratios Estatales"
  }
}
