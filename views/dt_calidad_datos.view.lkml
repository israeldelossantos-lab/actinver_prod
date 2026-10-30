view: calidad_datos {
  derived_table: {
    sql:
      SELECT
        'R1' AS regla,
        'Clientes en CLIENTE_PRODUCTO sin cuenta en spine.cuenta' AS descripcion,
        'CLIENTE_PRODUCTO_09_10_2026' AS tabla,
        (SELECT COUNT(DISTINCT CUSTOMER_ID) FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`) AS registros_evaluados,
        (SELECT COUNT(DISTINCT cp.CUSTOMER_ID) FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` cp LEFT JOIN `@{dataset_spine}.cuenta` c ON cp.CUSTOMER_ID = CAST(c.id_cliente AS STRING) WHERE c.id_cliente IS NULL) AS registros_con_falla,
        'Crítica' AS severidad,
        'Se expone, no se corrige' AS accion
      UNION ALL
      SELECT
        'R2',
        'Cuentas sin fecha_apertura',
        'cuenta',
        (SELECT COUNT(*) FROM `@{dataset_spine}.cuenta`),
        (SELECT COUNTIF(fecha_apertura IS NULL) FROM `@{dataset_spine}.cuenta`),
        'Alta',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R3',
        'Pólizas con BAJA_LOGICA = 1',
        'POLIZAS',
        (SELECT COUNT(*) FROM `@{dataset_seguros}.POLIZAS`),
        (SELECT COUNTIF(BAJA_LOGICA = 1) FROM `@{dataset_seguros}.POLIZAS`),
        'Media',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R4',
        'Recibos duplicados en PRIMA_PAGADA_2026',
        'PRIMA_PAGADA_2026',
        (SELECT COUNT(*) FROM `@{dataset_seguros}.PRIMA_PAGADA_2026`),
        COALESCE((SELECT SUM(fallas) FROM (SELECT COUNT(*) - 1 AS fallas FROM `@{dataset_seguros}.PRIMA_PAGADA_2026` GROUP BY POLIZA, RECIBO, EXHIBICION, ID_RIESGO_CONTABLE HAVING COUNT(*) > 1)), 0),
        'Crítica',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R5',
        'Recibos sin FECHA_PAGO',
        'PRIMA_PAGADA_2026',
        (SELECT COUNT(*) FROM `@{dataset_seguros}.PRIMA_PAGADA_2026`),
        (SELECT COUNTIF(FECHA_PAGO IS NULL) FROM `@{dataset_seguros}.PRIMA_PAGADA_2026`),
        'Alta',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R6',
        'Pólizas con ID_LOCALIDAD fuera de clave INEGI válida',
        'POLIZAS',
        (SELECT COUNT(*) FROM `@{dataset_seguros}.POLIZAS`),
        (SELECT COUNTIF(ID_LOCALIDAD IS NULL OR SAFE_CAST(ID_LOCALIDAD AS INT64) IS NULL OR DIV(SAFE_CAST(ID_LOCALIDAD AS INT64), 1000) NOT BETWEEN 1 AND 32) FROM `@{dataset_seguros}.POLIZAS`),
        'Media',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R7',
        'Cuenta eje con bandera sin conteo (HAS_CUENTA_EJE = 1 y CUENTA_EJE = 0)',
        'CLIENTE_PRODUCTO_09_10_2026',
        (SELECT COUNT(*) FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`),
        (SELECT COUNTIF(HAS_CUENTA_EJE = 1 AND (CUENTA_EJE = 0 OR CUENTA_EJE IS NULL)) FROM `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026`),
        'Alta',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R8',
        'Emisiones con FECHA_EMISION_POLIZA posterior a hoy',
        'PRIMA_EMITIDA_2026',
        (SELECT COUNT(*) FROM `@{dataset_seguros}.PRIMA_EMITIDA_2026`),
        (SELECT COUNTIF(DATE(FECHA_EMISION_POLIZA) > CURRENT_DATE('America/Mexico_City')) FROM `@{dataset_seguros}.PRIMA_EMITIDA_2026`),
        'Crítica',
        'Se expone, no se corrige'
      UNION ALL
      SELECT
        'R9 [candidata]',
        'Cuentas canceladas (C02/CC02) de clientes con tenencia',
        'cuenta',
        (SELECT COUNT(*) FROM `@{dataset_spine}.cuenta` c JOIN `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` cp ON CAST(c.id_cliente AS STRING) = cp.CUSTOMER_ID),
        (SELECT COUNT(*) FROM `@{dataset_spine}.cuenta` c JOIN `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` cp ON CAST(c.id_cliente AS STRING) = cp.CUSTOMER_ID WHERE c.id_estatus_cuenta IN ('C02', 'CC02')),
        'Informativa',
        'Se expone, no se corrige'
    ;;
  }

  dimension: regla {
    primary_key: yes
    type: string
    label: "Regla"
    sql: ${TABLE}.regla ;;
  }

  dimension: descripcion {
    type: string
    label: "Descripción de la Regla"
    sql: ${TABLE}.descripcion ;;
  }

  dimension: tabla {
    type: string
    label: "Tabla Evaluada"
    sql: ${TABLE}.tabla ;;
  }

  dimension: registros_evaluados {
    type: number
    label: "Registros Evaluados"
    sql: ${TABLE}.registros_evaluados ;;
    value_format_name: decimal_0
  }

  dimension: registros_con_falla {
    type: number
    label: "Registros con Falla"
    sql: ${TABLE}.registros_con_falla ;;
    value_format_name: decimal_0
  }

  dimension: pct_falla {
    type: number
    label: "% de Falla"
    sql: 1.0 * ${registros_con_falla} / NULLIF(${registros_evaluados}, 0) ;;
    value_format: "0.00%"
  }

  dimension: severidad {
    type: string
    label: "Severidad"
    sql: ${TABLE}.severidad ;;
  }

  dimension: accion {
    type: string
    label: "Acción"
    sql: ${TABLE}.accion ;;
  }

  dimension: estado_regla {
    type: string
    label: "Estatus de Regla"
    sql: CASE WHEN ${registros_con_falla} = 0 THEN 'Conforme' ELSE 'Con Observación' END ;;
  }

  measure: total_reglas {
    type: count
    label: "Reglas Evaluadas"
    value_format_name: decimal_0
  }

  measure: reglas_con_falla {
    type: count
    label: "Reglas con Observación"
    filters: [registros_con_falla: "> 0"]
    value_format_name: decimal_0
  }

  measure: reglas_sin_falla {
    type: count
    label: "Reglas Conformes"
    filters: [registros_con_falla: "0"]
    value_format_name: decimal_0
  }

  measure: total_registros_evaluados {
    type: sum
    label: "Total Registros Evaluados"
    sql: ${registros_evaluados} ;;
    value_format_name: decimal_0
  }

  measure: total_registros_con_falla {
    type: sum
    label: "Total Registros con Falla"
    sql: ${registros_con_falla} ;;
    value_format_name: decimal_0
  }

  measure: pct_promedio_falla {
    type: average
    label: "% Promedio de Falla"
    sql: 1.0 * ${registros_con_falla} / NULLIF(${registros_evaluados}, 0) ;;
    value_format: "0.00%"
  }
}
