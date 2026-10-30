view: dt_vencimientos_seguros {
  derived_table: {
    sql:
      SELECT 
        p.POLIZA AS poliza,
        MIN(p.FECHA_INICIO_VIGENCIA) AS fecha_inicio_vigencia,
        MAX(p.FECHA_FIN_VIGENCIA) AS fecha_fin_vigencia,
        DATE_DIFF(DATE(MAX(p.FECHA_FIN_VIGENCIA)), CURRENT_DATE('America/Mexico_City'), DAY) AS dias_para_vencer,
        CASE
          WHEN DATE(MAX(p.FECHA_FIN_VIGENCIA)) BETWEEN CURRENT_DATE('America/Mexico_City') AND DATE_ADD(CURRENT_DATE('America/Mexico_City'), INTERVAL 30 DAY) THEN '1. Por vencer (30 días)'
          WHEN DATE(MAX(p.FECHA_FIN_VIGENCIA)) BETWEEN DATE_ADD(CURRENT_DATE('America/Mexico_City'), INTERVAL 31 DAY) AND DATE_ADD(CURRENT_DATE('America/Mexico_City'), INTERVAL 60 DAY) THEN '2. Por vencer (60 días)'
          WHEN DATE(MAX(p.FECHA_FIN_VIGENCIA)) BETWEEN DATE_ADD(CURRENT_DATE('America/Mexico_City'), INTERVAL 61 DAY) AND DATE_ADD(CURRENT_DATE('America/Mexico_City'), INTERVAL 90 DAY) THEN '3. Por vencer (90 días)'
          WHEN DATE(MAX(p.FECHA_FIN_VIGENCIA)) < CURRENT_DATE('America/Mexico_City') THEN '4. Vencida'
          ELSE '5. Vigente > 90 días'
        END AS ventana_vencimiento,
        CASE 
          WHEN (MAX(p.POLIZA_ANTERIOR) IS NOT NULL AND TRIM(MAX(p.POLIZA_ANTERIOR)) NOT IN ('', '0', '-1')) THEN 'Renovación'
          WHEN MAX(CASE WHEN pe.ID_TIPO_TRANSACCION = 2 THEN 1 ELSE 0 END) = 1 THEN 'Renovación'
          ELSE 'Nuevo Negocio'
        END AS tipo_emision,
        pe.prima_poliza AS prima_poliza
      FROM `@{dataset_seguros}.POLIZAS` p
      LEFT JOIN (
        SELECT POLIZA, SUM(PRIMA_DIRECTA) AS prima_poliza, MAX(ID_TIPO_TRANSACCION) AS ID_TIPO_TRANSACCION
        FROM `@{dataset_seguros}.PRIMA_EMITIDA_2026`
        WHERE BAJA_LOGICA = 0
        GROUP BY POLIZA
      ) pe ON p.POLIZA = pe.POLIZA
      WHERE p.BAJA_LOGICA = 0
      GROUP BY p.POLIZA, pe.prima_poliza
    ;;
  }

  parameter: ventana_dias {
    type: number
    label: "Ventana de Días por Vencer"
    description: "Ventana de análisis de vencimiento (30, 60 o 90 días)"
    default_value: "90"
    allowed_value: { label: "30 días" value: "30" }
    allowed_value: { label: "60 días" value: "60" }
    allowed_value: { label: "90 días" value: "90" }
  }

  dimension: poliza {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.poliza ;;
  }

  dimension_group: fecha_inicio_vigencia {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.fecha_inicio_vigencia ;;
  }

  dimension_group: fecha_fin_vigencia {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.fecha_fin_vigencia ;;
  }

  dimension: dias_para_vencer {
    type: number
    label: "Días para Vencer"
    sql: ${TABLE}.dias_para_vencer ;;
  }

  dimension: ventana_vencimiento {
    type: string
    label: "Ventana de Vencimiento"
    description: "Periodo descriptivo: 30, 60 o 90 días, vencida o vigente"
    sql: ${TABLE}.ventana_vencimiento ;;
  }

  dimension: es_por_vencer {
    type: yesno
    label: "Por Vencer (según parámetro)"
    sql:
      {% if ventana_dias._parameter_value == '30' %}
        ${dias_para_vencer} >= 0 AND ${dias_para_vencer} <= 30
      {% elsif ventana_dias._parameter_value == '60' %}
        ${dias_para_vencer} >= 0 AND ${dias_para_vencer} <= 60
      {% else %}
        ${dias_para_vencer} >= 0 AND ${dias_para_vencer} <= 90
      {% endif %}
    ;;
  }

  dimension: es_por_vencer_90d {
    type: yesno
    label: "Por Vencer (Próximos 90 días)"
    sql: ${dias_para_vencer} >= 0 AND ${dias_para_vencer} <= 90 ;;
  }

  dimension: tipo_emision {
    type: string
    label: "Tipo de Emisión"
    description: "Renovación vs Nuevo Negocio"
    sql: ${TABLE}.tipo_emision ;;
  }

  dimension: prima_poliza {
    type: number
    hidden: yes
    sql: ${TABLE}.prima_poliza ;;
  }

  measure: polizas_por_vencer_count {
    type: count_distinct
    label: "Pólizas por Vencer"
    sql: ${TABLE}.poliza ;;
    filters: [es_por_vencer: "yes"]
    value_format_name: decimal_0
  }

  measure: prima_renovable_total {
    type: sum
    label: "Prima Renovable en Riesgo"
    description: "Monto de prima renovable en riesgo según ventana seleccionada"
    sql: ${prima_poliza} ;;
    filters: [es_por_vencer: "yes"]
    value_format: "$#,##0"
  }

  measure: polizas_sin_prima {
    type: count_distinct
    label: "Pólizas Sin Prima Registrada"
    sql: ${TABLE}.poliza ;;
    filters: [prima_poliza: "null"]
    value_format_name: decimal_0
  }
}
