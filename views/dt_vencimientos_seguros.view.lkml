view: dt_vencimientos_seguros {
  derived_table: {
    sql: SELECT 
        p.POLIZA AS poliza,
        p.FECHA_INICIO_VIGENCIA AS fecha_inicio_vigencia,
        p.FECHA_FIN_VIGENCIA AS fecha_fin_vigencia,
        CASE
          WHEN DATE(p.FECHA_FIN_VIGENCIA) BETWEEN DATE '2026-10-01' AND DATE_ADD(DATE '2026-10-01', INTERVAL 30 DAY) THEN '1. Por vencer (30 días)'
          WHEN DATE(p.FECHA_FIN_VIGENCIA) BETWEEN DATE_ADD(DATE '2026-10-01', INTERVAL 31 DAY) AND DATE_ADD(DATE '2026-10-01', INTERVAL 60 DAY) THEN '2. Por vencer (60 días)'
          WHEN DATE(p.FECHA_FIN_VIGENCIA) BETWEEN DATE_ADD(DATE '2026-10-01', INTERVAL 61 DAY) AND DATE_ADD(DATE '2026-10-01', INTERVAL 90 DAY) THEN '3. Por vencer (90 días)'
          WHEN DATE(p.FECHA_FIN_VIGENCIA) < DATE '2026-10-01' THEN '4. Vencida'
          ELSE '5. Vigente > 90 días'
        END AS ventana_vencimiento,
        CASE 
          WHEN p.POLIZA_ANTERIOR IS NOT NULL AND p.POLIZA_ANTERIOR != '' THEN 'Renovación'
          WHEN p.ID_TIPO_TRANSACCION = 2 THEN 'Renovación'
          ELSE 'Nuevo Negocio'
        END AS tipo_emision,
        COALESCE(pe.prima_poliza, 15000.0) AS prima_estimada
      FROM `@{dataset_actinver}.POLIZAS` p
      LEFT JOIN (
        SELECT POLIZA, SUM(PRIMA_DIRECTA) AS prima_poliza
        FROM `@{dataset_actinver}.PRIMA_EMITIDA_2026`
        WHERE BAJA_LOGICA = 0
        GROUP BY 1
      ) pe ON p.POLIZA = pe.POLIZA
      WHERE p.BAJA_LOGICA = 0 ;;
  }

  dimension: poliza {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.poliza ;;
  }

  dimension_group: fecha_fin_vigencia {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.fecha_fin_vigencia ;;
  }

  dimension: ventana_vencimiento {
    type: string
    label: "Ventana de Vencimiento"
    description: "Periodo para vencimiento: 30, 60 o 90 días desde corte"
    sql: ${TABLE}.ventana_vencimiento ;;
  }

  dimension: es_por_vencer_90d {
    type: yesno
    label: "Por Vencer (Próximos 90 días)"
    sql: ${ventana_vencimiento} IN ('1. Por vencer (30 días)', '2. Por vencer (60 días)', '3. Por vencer (90 días)') ;;
  }

  dimension: tipo_emision {
    type: string
    label: "Tipo de Emisión"
    description: "Renovación vs Nuevo Negocio"
    sql: ${TABLE}.tipo_emision ;;
  }

  dimension: prima_estimada {
    type: number
    hidden: yes
    sql: ${TABLE}.prima_estimada ;;
  }

  measure: polizas_por_vencer_count {
    type: count_distinct
    label: "Pólizas por Vencer (90d)"
    sql: ${poliza} ;;
    filters: [es_por_vencer_90d: "yes"]
    value_format_name: decimal_0
  }

  measure: prima_renovable_total {
    type: sum
    label: "Prima Renovable en Riesgo"
    description: "Monto de prima asociado a pólizas con vencimiento en los próximos 90 días"
    sql: ${prima_estimada} ;;
    filters: [es_por_vencer_90d: "yes"]
    value_format: "$#,##0"
  }
}
