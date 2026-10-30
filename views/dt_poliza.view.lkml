view: dt_poliza {
  derived_table: {
    sql:
      SELECT
        p.POLIZA AS poliza,
        ANY_VALUE(p.ID_PRODUCTO) AS id_producto,
        ANY_VALUE(p.ID_CANAL_VENTA) AS id_canal_venta,
        MIN(p.FECHA_INICIO_VIGENCIA) AS fecha_inicio_vigencia,
        MAX(p.FECHA_FIN_VIGENCIA) AS fecha_fin_vigencia,
        COALESCE(SUM(pe.PRIMA_DIRECTA), 0) AS prima_directa_neta,
        CASE
          WHEN MAX(CASE WHEN pe.ID_TIPO_TRANSACCION = 2 THEN 1 ELSE 0 END) = 1
            OR (MAX(p.POLIZA_ANTERIOR) IS NOT NULL
                AND TRIM(MAX(p.POLIZA_ANTERIOR)) NOT IN ('', '0', '-1'))
          THEN TRUE
          ELSE FALSE
        END AS es_renovacion
      FROM `@{dataset_seguros}.POLIZAS` p
      LEFT JOIN `@{dataset_seguros}.PRIMA_EMITIDA_2026` pe
        ON p.POLIZA = pe.POLIZA AND pe.BAJA_LOGICA = 0
      WHERE p.BAJA_LOGICA = 0
      GROUP BY p.POLIZA
    ;;
  }

  dimension: poliza_ref {
    type: string
    label: "Referencia Póliza"
    description: "Identificador anonimizado de póliza para visualizaciones públicas"
    sql: CONCAT('***', SUBSTR(${TABLE}.poliza, -4)) ;;
  }

  dimension: poliza {
    primary_key: yes
    type: string
    label: "Póliza"
    sql: ${TABLE}.poliza ;;
  }

  dimension: id_producto {
    type: number
    label: "ID Producto"
    sql: ${TABLE}.id_producto ;;
  }

  dimension: id_canal_venta {
    type: number
    hidden: yes
    sql: ${TABLE}.id_canal_venta ;;
  }

  dimension_group: fecha_inicio_vigencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Inicio Vigencia"
    sql: ${TABLE}.fecha_inicio_vigencia ;;
  }

  dimension_group: fecha_fin_vigencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    label: "Fecha Fin Vigencia"
    sql: ${TABLE}.fecha_fin_vigencia ;;
  }

  dimension: prima_directa_neta {
    type: number
    label: "Prima Directa Neta Póliza"
    sql: ${TABLE}.prima_directa_neta ;;
    value_format: "$#,##0"
  }

  dimension: es_renovacion {
    type: yesno
    label: "Es Renovación (Cálculo Correcto)"
    description: "Póliza con transacción tipo 2 o con número de póliza anterior válido"
    sql: ${TABLE}.es_renovacion ;;
  }

  dimension: tipo_negocio {
    type: string
    label: "Tipo de Negocio (Nuevo vs Renovación)"
    sql: CASE WHEN ${TABLE}.es_renovacion THEN 'Renovación' ELSE 'Nuevo Negocio' END ;;
  }

  measure: total_polizas {
    type: count
    label: "Total Pólizas Únicas"
    value_format_name: decimal_0
  }

  measure: polizas_renovacion {
    type: count
    label: "Pólizas Renovación"
    filters: [es_renovacion: "yes"]
    value_format_name: decimal_0
  }

  measure: polizas_nuevo_negocio {
    type: count
    label: "Pólizas Nuevo Negocio"
    filters: [es_renovacion: "no"]
    value_format_name: decimal_0
  }

  measure: pct_renovacion {
    type: number
    label: "Tasa de Renovación"
    sql: 1.0 * ${polizas_renovacion} / NULLIF(${total_polizas}, 0) ;;
    value_format: "0.0%"
  }
}
