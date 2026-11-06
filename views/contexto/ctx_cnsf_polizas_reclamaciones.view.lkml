# Vista de Pólizas en Vigor y Reclamaciones por Entidad y Ramo (CNSF)
# Fuente: contexto_externo.v_cnsf_polizas_reclamaciones_entidad
view: ctx_cnsf_polizas_reclamaciones {
  sql_table_name: `@{dataset_contexto}.v_cnsf_polizas_reclamaciones_entidad` ;;
  label: "Mercado Seguros: Reclamaciones (CNSF)"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    # Incluye entidad: "Extranjero", "Desconocido" y "No aplica" comparten la clave 99
    sql: CONCAT(CAST(${TABLE}.anio AS STRING), '-', ${TABLE}.clave_estado_inegi, '-', ${TABLE}.entidad, '-', ${TABLE}.ramo_codigo) ;;
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
    label: "Clave INEGI"
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: ramo {
    type: string
    label: "Ramo"
    sql: ${TABLE}.ramo ;;
  }

  # ----------------------------------------------------
  # MÉTRICAS Y AGREGACIONES
  # ----------------------------------------------------
  measure: total_polizas_vigor {
    type: sum
    label: "Pólizas en Vigor"
    sql: ${TABLE}.polizas_vigor ;;
    value_format_name: decimal_0
    group_label: "Volumen"
  }

  measure: total_reclamaciones_recibidas {
    type: sum
    label: "Reclamaciones Recibidas"
    sql: ${TABLE}.reclamaciones_recibidas ;;
    value_format_name: decimal_0
    group_label: "Reclamaciones"
  }

  measure: reclamaciones_por_1000_polizas {
    type: number
    label: "Reclamaciones por c/1,000 Pólizas"
    description: "Índice de conflictividad / calidad de servicio sectorial"
    sql: SAFE_DIVIDE(${total_reclamaciones_recibidas} * 1000.0, ${total_polizas_vigor}) ;;
    value_format: "0.00"
    group_label: "Ratios Técnicos"
  }
}
