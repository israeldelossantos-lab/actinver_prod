# Vista Comparativa Actinver vs Mercado por Ramo (CNSF Benchmark)
# Fuente: contexto_externo.v_actinver_vs_mercado_ramo
view: ctx_actinver_vs_mercado_ramo {
  sql_table_name: `@{dataset_contexto}.v_actinver_vs_mercado_ramo` ;;
  label: "Benchmark: Actinver vs Mercado (CNSF)"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.anio_actinver AS STRING), '-', ${TABLE}.lob, '-', ${TABLE}.sublob) ;;
  }

  dimension: anio_actinver {
    type: number
    label: "Año Actinver"
    sql: ${TABLE}.anio_actinver ;;
    value_format_name: id
  }

  dimension: lob {
    type: string
    label: "Línea de Negocio (LOB)"
    sql: ${TABLE}.lob ;;
  }

  dimension: sublob {
    type: string
    label: "Sub Línea de Negocio"
    sql: ${TABLE}.sublob ;;
  }

  dimension: ramo_normalizado {
    type: string
    label: "Ramo Homologado CNSF"
    sql: ${TABLE}.ramo_normalizado ;;
  }

  dimension: ramo_display {
    type: string
    label: "Ramo de Despliegue"
    description: "Ramo homologado o aviso de sin asignar para LOBs no definidas"
    sql: ${TABLE}.ramo_display ;;
  }

  dimension: operacion {
    type: string
    label: "Operación de Seguro"
    sql: ${TABLE}.operacion ;;
  }

  dimension: meses_actinver {
    type: number
    label: "Meses Transcurridos Actinver"
    sql: ${TABLE}.meses_actinver ;;
  }

  dimension: anio_mercado_usado {
    type: number
    label: "Año Benchmark Mercado"
    sql: ${TABLE}.anio_mercado_usado ;;
    value_format_name: id
  }

  dimension: aviso_metodologico {
    type: string
    label: "Nota Metodológica"
    description: "Aviso de trazabilidad del cálculo o estatus de asignación de LOB"
    sql: ${TABLE}.aviso_metodologico ;;
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: prima_directa_actinver {
    type: sum
    label: "Prima Directa Actinver (Periodo)"
    description: "Prima directa real emitida en el periodo transcurrido (sin anualizar)"
    sql: ${TABLE}.prima_directa_actinver ;;
    value_format_name: usd_0
    group_label: "Actinver"
  }

  measure: prima_actinver_anualizada {
    type: sum
    label: "Prima Actinver Anualizada"
    description: "Prima emitida extrapolada a 12 meses (prima * 12 / meses)"
    sql: ${TABLE}.prima_actinver_anualizada ;;
    value_format_name: usd_0
    group_label: "Actinver"
  }

  measure: prima_total_actinver {
    type: sum
    label: "Prima Total Actinver"
    sql: ${TABLE}.prima_total_actinver ;;
    value_format_name: usd_0
    group_label: "Actinver"
  }

  measure: polizas_actinver {
    type: sum
    label: "Pólizas Actinver"
    sql: ${TABLE}.polizas_actinver ;;
    value_format_name: decimal_0
    group_label: "Actinver"
  }

  measure: prima_mercado {
    type: sum
    label: "Prima Total del Sector (Mercado 2025)"
    sql: ${TABLE}.prima_mercado ;;
    value_format_name: usd_0
    group_label: "Mercado Sectorial"
  }

  measure: polizas_mercado {
    type: sum
    label: "Pólizas del Sector (Mercado 2025)"
    sql: ${TABLE}.polizas_mercado ;;
    value_format_name: decimal_0
    group_label: "Mercado Sectorial"
  }

  measure: participacion_mercado_pct {
    type: number
    label: "Participación de Mercado Actinver % (Anualizada)"
    description: "Prima anualizada de Actinver entre prima total del sector en el ramo"
    sql: SAFE_DIVIDE(${prima_actinver_anualizada}, ${prima_mercado}) * 100.0 ;;
    value_format: "0.000\"%\""
    group_label: "Cuota de Mercado"
  }
}
