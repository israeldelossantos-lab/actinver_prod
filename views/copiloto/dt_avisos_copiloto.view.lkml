# Avisos del día para el CLIENTE: alimenta la pestaña Inicio de la app (Para ti hoy) y las tarjetas del avatar.
# Dirigido en segunda persona al cliente final.
# Mezcla datos REALES del modelo (pólizas por vencer, domiciliación, venta cruzada) con datos
# SINTÉTICOS de demo_copiloto (vencimientos de inversión).

view: dt_avisos_copiloto {
  derived_table: {
    sql:
      WITH cli AS (
        SELECT id_cliente_num, id_asesor, IFNULL(CAST(segmento_awm AS BOOL), FALSE) AS awm
        FROM `@{dataset_spine}.cliente`
      ),
      contacto AS (
        SELECT id_cliente_num,
               DATE_DIFF(CURRENT_DATE('America/Mexico_City'), MAX(fecha_contacto), DAY) AS dias_sin_contacto
        FROM `@{dataset_copiloto}.v_contacto_asesor`
        GROUP BY id_cliente_num
      ),
      avisos AS (
        -- 1. Inversión que vence en 7 días o menos (SINTÉTICO)
        SELECT
          CONCAT('venc-', v.id_instrumento) AS id_aviso,
          v.id_cliente_num,
          'Vencimiento de inversión' AS tipo,
          1 AS prioridad,
          CONCAT('Tu ', v.instrumento, ' vence en ', CAST(v.dias_para_vencer AS STRING), ' días',
                 IF(v.renovacion_automatica, ' (renovación automática pactada)', ' y no tiene renovación automática. Si no haces nada, el dinero pasa a tu cuenta eje.')) AS motivo,
          v.monto_mxn AS monto_mxn,
          'Hablar con mi asesor' AS accion_sugerida,
          'sintetico' AS origen_dato
        FROM `@{dataset_copiloto}.v_vencimiento_inversion` v
        WHERE v.dias_para_vencer BETWEEN 0 AND 7

        UNION ALL

        -- 2. Póliza que vence en 30 días o menos y no está domiciliada (REAL)
        SELECT
          CONCAT('pol-', vs.poliza) AS id_aviso,
          p.ID_NUMERO_RELACION AS id_cliente_num,
          'Póliza por vencer sin domiciliar' AS tipo,
          2 AS prioridad,
          CONCAT('Tu póliza vence en ', CAST(vs.dias_para_vencer AS STRING), ' días y el pago no está domiciliado. Domicíliala para que tu cobertura no se interrumpa.') AS motivo,
          vs.prima_poliza AS monto_mxn,
          'Domiciliar pago' AS accion_sugerida,
          'real' AS origen_dato
        FROM ${dt_vencimientos_seguros.SQL_TABLE_NAME} vs
        JOIN `@{dataset_seguros}.POLIZAS` p ON p.POLIZA = vs.poliza AND p.BAJA_LOGICA = 0
        LEFT JOIN ${domiciliado.SQL_TABLE_NAME} d ON d.POLIZA = vs.poliza AND d.BAJA_LOGICA = 0
        WHERE vs.dias_para_vencer BETWEEN 0 AND 30
          AND d.POLIZA IS NULL
          AND p.ID_NUMERO_RELACION IS NOT NULL

        UNION ALL

        -- 4. Oportunidad de venta cruzada con afinidad alta (REAL)
        -- (El aviso 3 del asesor se retiró conforme al alcance del cliente)
        SELECT
          CONCAT('opo-', s.customer_id) AS id_aviso,
          SAFE_CAST(s.customer_id AS INT64) AS id_cliente_num,
          'Podría interesarte' AS tipo,
          3 AS prioridad,
          CONCAT('El ', CAST(ROUND(s.pct_1) AS STRING), ' % de los clientes con productos como los tuyos también tiene ', s.producto_1, '. Información general, no es una recomendación personalizada. Tu asesor puede revisar si va con tu perfil.') AS motivo,
          CAST(NULL AS FLOAT64) AS monto_mxn,
          'Preguntarle a mi asesor' AS accion_sugerida,
          'real' AS origen_dato
        FROM ${dt_siguiente_producto_sugerido.SQL_TABLE_NAME} s
        LEFT JOIN contacto k ON k.id_cliente_num = SAFE_CAST(s.customer_id AS INT64)
        WHERE s.metodo = 'Afinidad' AND s.lift_1 >= 1.3
      )
      SELECT a.*, c.id_asesor AS id_asesor_cve, c.awm
      FROM avisos a
      JOIN cli c USING (id_cliente_num) ;;
  }
  label: "App del cliente: avisos"

  dimension: id_aviso {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id_aviso ;;
  }

  dimension: id_cliente_num {
    type: number
    value_format_name: id
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: prioridad {
    type: number
    sql: ${TABLE}.prioridad ;;
  }

  dimension: motivo {
    type: string
    sql: ${TABLE}.motivo ;;
  }

  dimension: monto_mxn {
    type: number
    sql: ${TABLE}.monto_mxn ;;
    value_format_name: usd_0
  }

  dimension: accion_sugerida {
    type: string
    sql: ${TABLE}.accion_sugerida ;;
  }

  dimension: origen_dato {
    type: string
    sql: ${TABLE}.origen_dato ;;
  }

  dimension: id_asesor_cve {
    type: string
    sql: ${TABLE}.id_asesor_cve ;;
  }

  measure: count {
    type: count
    drill_fields: [id_aviso, tipo, motivo, monto_mxn, accion_sugerida]
  }

  measure: total_monto {
    type: sum
    sql: ${monto_mxn} ;;
    value_format_name: usd_0
  }
}
