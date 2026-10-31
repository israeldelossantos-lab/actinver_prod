# Una fila por entidad federativa con el último dato de cada indicador público.
# Fuentes: INEGI (PIB estatal, población, desocupación, ITAEE) y DataMéxico (ingreso de los hogares ENIGH,
# salario ENOE, inversión extranjera directa).
# Excluidas a propósito hasta corregir la ingesta (prompt 07): REMESAS_FAMILIARES_MDD (valor de relleno)
# y POB_18_MAS (mal escalada).
view: ctx_estado {
  derived_table: {
    sql:
      WITH series AS (
        SELECT clave_estado_inegi, serie_id, fecha, valor FROM `@{dataset_contexto}.inegi_estatal`
        WHERE clave_estado_inegi != '00' AND serie_id IN ('PIBE_CONST', 'POB_TOTAL', 'ENOE_DESOCUP', 'ITAEE_TOTAL') AND valor IS NOT NULL
        UNION ALL
        SELECT clave_estado_inegi, serie_id, fecha, valor FROM `@{dataset_contexto}.datamexico_estatal`
        WHERE serie_id IN ('ENIGH_INGRESO_PROMEDIO_HOGAR', 'ENOE_SALARIO_PROMEDIO_MENSUAL', 'IED_ANUAL_MDD') AND valor IS NOT NULL
      ),
      ultimos AS (
        -- POB_TOTAL incluye proyecciones; se usa el dato más reciente que no sea futuro.
        SELECT clave_estado_inegi, serie_id,
          ARRAY_AGG(STRUCT(fecha, valor) ORDER BY fecha DESC LIMIT 2) AS ult
        FROM series
        WHERE fecha <= CURRENT_DATE()
        GROUP BY 1, 2
      ),
      pivote AS (
        SELECT clave_estado_inegi,
          MAX(IF(serie_id = 'PIBE_CONST', ult[OFFSET(0)].valor, NULL)) AS pib_mdp,
          MAX(IF(serie_id = 'PIBE_CONST', EXTRACT(YEAR FROM ult[OFFSET(0)].fecha), NULL)) AS pib_anio,
          MAX(IF(serie_id = 'PIBE_CONST' AND ARRAY_LENGTH(ult) > 1, ult[OFFSET(0)].valor / NULLIF(ult[OFFSET(1)].valor, 0) - 1, NULL)) AS pib_crecimiento,
          MAX(IF(serie_id = 'POB_TOTAL', ult[OFFSET(0)].valor, NULL)) AS poblacion,
          MAX(IF(serie_id = 'POB_TOTAL', EXTRACT(YEAR FROM ult[OFFSET(0)].fecha), NULL)) AS poblacion_anio,
          MAX(IF(serie_id = 'ENOE_DESOCUP', ult[OFFSET(0)].valor, NULL)) AS desocupacion,
          MAX(IF(serie_id = 'ITAEE_TOTAL', ult[OFFSET(0)].valor, NULL)) AS itaee,
          MAX(IF(serie_id = 'ENIGH_INGRESO_PROMEDIO_HOGAR', ult[OFFSET(0)].valor, NULL)) AS ingreso_hogar,
          MAX(IF(serie_id = 'ENOE_SALARIO_PROMEDIO_MENSUAL', ult[OFFSET(0)].valor, NULL)) AS salario,
          MAX(IF(serie_id = 'IED_ANUAL_MDD', ult[OFFSET(0)].valor, NULL)) AS ied_mdd
        FROM ultimos
        GROUP BY 1
      )
      SELECT c.clave_estado_inegi, c.estado_nombre, c.estado_nombre_actinver, c.abreviatura, p.* EXCEPT (clave_estado_inegi),
        SAFE_DIVIDE(p.pib_mdp, SUM(p.pib_mdp) OVER ()) AS participacion_pib,
        SAFE_DIVIDE(p.ied_mdd, SUM(p.ied_mdd) OVER ()) AS participacion_ied,
        SAFE_DIVIDE(p.poblacion, SUM(p.poblacion) OVER ()) AS participacion_poblacion,
        RANK() OVER (ORDER BY p.pib_mdp DESC) AS rango_pib,
        RANK() OVER (ORDER BY p.ied_mdd DESC) AS rango_ied,
        RANK() OVER (ORDER BY p.ingreso_hogar DESC) AS rango_ingreso
      FROM `@{dataset_contexto}.cat_estados` c
      LEFT JOIN pivote p USING (clave_estado_inegi) ;;
  }
  label: "Estado: economía"

  dimension: clave_estado_inegi {
    primary_key: yes
    type: string
    label: "Clave del estado (INEGI)"
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: estado {
    type: string
    label: "Estado"
    description: "Nombre de la entidad federativa como se usa en Actinver (ej. Estado de México, Coahuila, Veracruz)"
    sql: COALESCE(${TABLE}.estado_nombre_actinver, ${TABLE}.estado_nombre) ;;
  }

  dimension: estado_nombre_oficial {
    type: string
    label: "Estado (nombre oficial INEGI)"
    sql: ${TABLE}.estado_nombre ;;
  }

  dimension: pib_anio {
    type: number
    label: "Año del PIB estatal"
    value_format_name: id
    sql: ${TABLE}.pib_anio ;;
  }

  dimension: poblacion_anio {
    type: number
    label: "Año de la población"
    value_format_name: id
    sql: ${TABLE}.poblacion_anio ;;
  }

  dimension: rango_pib {
    type: number
    label: "Lugar nacional por PIB"
    description: "1 = la economía más grande del país"
    sql: ${TABLE}.rango_pib ;;
  }

  dimension: rango_ied {
    type: number
    label: "Lugar nacional por inversión extranjera"
    sql: ${TABLE}.rango_ied ;;
  }

  dimension: rango_ingreso {
    type: number
    label: "Lugar nacional por ingreso de los hogares"
    sql: ${TABLE}.rango_ingreso ;;
  }

  measure: pib_mdp {
    type: sum
    label: "PIB estatal (millones de pesos de 2018)"
    description: "PIB a precios constantes de 2018, último año disponible (INEGI)"
    sql: ${TABLE}.pib_mdp ;;
    value_format_name: decimal_0
  }

  measure: pib_crecimiento {
    type: average
    label: "Crecimiento del PIB estatal (%)"
    description: "Variación real del último año contra el anterior"
    sql: ${TABLE}.pib_crecimiento ;;
    value_format: "0.0%"
  }

  measure: participacion_pib {
    type: sum
    label: "% del PIB nacional"
    sql: ${TABLE}.participacion_pib ;;
    value_format: "0.0%"
  }

  measure: poblacion {
    type: sum
    label: "Población"
    description: "Población total, dato más reciente no proyectado a futuro (INEGI)"
    sql: ${TABLE}.poblacion ;;
    value_format_name: decimal_0
  }

  measure: participacion_poblacion {
    type: sum
    label: "% de la población nacional"
    sql: ${TABLE}.participacion_poblacion ;;
    value_format: "0.0%"
  }

  measure: ingreso_hogar {
    type: average
    label: "Ingreso trimestral promedio por hogar (MXN)"
    description: "ENIGH 2022, vía DataMéxico"
    sql: ${TABLE}.ingreso_hogar ;;
    value_format_name: decimal_0
  }

  measure: salario {
    type: average
    label: "Salario mensual promedio (MXN)"
    description: "ENOE, vía DataMéxico"
    sql: ${TABLE}.salario ;;
    value_format_name: decimal_0
  }

  measure: ied_mdd {
    type: sum
    label: "Inversión extranjera directa 2024 (millones de US$)"
    description: "Secretaría de Economía, vía DataMéxico"
    sql: ${TABLE}.ied_mdd ;;
    value_format_name: decimal_0
  }

  measure: participacion_ied {
    type: sum
    label: "% de la inversión extranjera nacional"
    sql: ${TABLE}.participacion_ied ;;
    value_format: "0.0%"
  }

  measure: desocupacion {
    type: average
    label: "Tasa de desocupación (%)"
    description: "ENOE, último trimestre disponible (INEGI)"
    sql: ${TABLE}.desocupacion ;;
    value_format_name: decimal_1
  }

  measure: itaee {
    type: average
    label: "Actividad económica estatal (ITAEE, índice)"
    sql: ${TABLE}.itaee ;;
    value_format_name: decimal_1
  }

  measure: estados {
    type: count
    label: "Número de estados"
  }
}
