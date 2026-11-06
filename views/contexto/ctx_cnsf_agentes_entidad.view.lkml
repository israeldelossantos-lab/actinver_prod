# Vista de Fuerza de Ventas e Intermediarios por Entidad (CNSF)
# Fuente: contexto_externo.v_cnsf_agentes_entidad
view: ctx_cnsf_agentes_entidad {
  sql_table_name: `@{dataset_contexto}.v_cnsf_agentes_entidad` ;;
  label: "Mercado Seguros: Agentes y Canales (CNSF)"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    # Clave + entidad: los registros sin estado del catálogo comparten la clave 99
    sql: CONCAT(${TABLE}.clave_estado_inegi, '-', ${TABLE}.entidad) ;;
  }

  dimension: clave_estado_inegi {
    type: string
    label: "Clave INEGI"
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: entidad {
    type: string
    label: "Entidad Federativa"
    sql: ${TABLE}.entidad ;;
  }

  dimension: anio_mercado_usado {
    type: number
    label: "Año Mercado Usado"
    sql: ${TABLE}.anio_mercado_usado ;;
    value_format_name: id
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: total_agentes_seguros {
    type: sum
    label: "Agentes de Seguros"
    sql: ${TABLE}.agentes_seguros ;;
    value_format_name: decimal_0
    group_label: "Fuerza de Ventas"
  }

  measure: total_apoderados_seguros {
    type: sum
    label: "Apoderados de Seguros"
    sql: ${TABLE}.apoderados_seguros ;;
    value_format_name: decimal_0
    group_label: "Fuerza de Ventas"
  }

  measure: total_fuerza_ventas_seguros {
    type: sum
    label: "Fuerza Total de Ventas Seguros"
    sql: ${TABLE}.total_fuerza_ventas_seguros ;;
    value_format_name: decimal_0
    group_label: "Fuerza de Ventas"
  }

  measure: total_prima_mercado_estado {
    type: sum
    label: "Prima Total Mercado Estatal"
    sql: ${TABLE}.prima_mercado_estado ;;
    value_format_name: usd_0
    group_label: "Mercado"
  }

  measure: prima_promedio_por_agente {
    type: number
    label: "Prima Promedio por Agente"
    description: "Prima estatal de mercado entre número de agentes de seguros"
    sql: SAFE_DIVIDE(${total_prima_mercado_estado}, ${total_agentes_seguros}) ;;
    value_format_name: usd_0
    group_label: "Productividad y Penetración"
  }
}
