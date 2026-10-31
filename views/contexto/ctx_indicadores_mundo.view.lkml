# Indicadores internacionales del Banco Mundial (WDI y Global Findex), anuales.
# Fuente: contexto_externo.bm_indicadores. Países: México, Brasil, Chile, Colombia, Perú, América Latina y Mundo.
# Licencia: CC BY 4.0, Banco Mundial.
view: ctx_indicadores_mundo {
  derived_table: {
    # es_ultimo marca el año más reciente con dato por indicador y país (los años varían entre países).
    sql: SELECT b.*,
           b.fecha = MAX(b.fecha) OVER (PARTITION BY b.serie_id, b.pais_iso3) AS es_ultimo
         FROM `@{dataset_contexto}.bm_indicadores` b
         WHERE b.valor IS NOT NULL ;;
  }
  label: "Indicadores internacionales"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.serie_id, '|', ${TABLE}.pais_iso3, '|', CAST(${TABLE}.fecha AS STRING)) ;;
  }

  dimension: pais {
    type: string
    label: "País o región"
    sql: CASE ${TABLE}.pais_iso3
      WHEN 'MEX' THEN 'México'
      WHEN 'BRA' THEN 'Brasil'
      WHEN 'CHL' THEN 'Chile'
      WHEN 'COL' THEN 'Colombia'
      WHEN 'PER' THEN 'Perú'
      WHEN 'LCN' THEN 'América Latina y el Caribe'
      WHEN 'WLD' THEN 'Mundo'
      ELSE ${TABLE}.pais_nombre
    END ;;
  }

  dimension: pais_iso3 {
    type: string
    label: "Código ISO del país"
    sql: ${TABLE}.pais_iso3 ;;
  }

  dimension: es_mexico {
    type: yesno
    label: "Es México"
    sql: ${TABLE}.pais_iso3 = 'MEX' ;;
  }

  dimension: indicador {
    type: string
    label: "Indicador"
    sql: CASE ${TABLE}.serie_id
      WHEN 'NY.GDP.MKTP.KD.ZG' THEN 'Crecimiento del PIB (%)'
      WHEN 'FP.CPI.TOTL.ZG' THEN 'Inflación anual (%)'
      WHEN 'NY.GDP.PCAP.CD' THEN 'PIB per cápita (US$)'
      WHEN 'NY.GDP.MKTP.CD' THEN 'PIB (US$)'
      WHEN 'SP.POP.TOTL' THEN 'Población'
      WHEN 'FX.OWN.TOTL.ZS' THEN 'Adultos con cuenta financiera (%)'
      WHEN 'GFDD.AI.06' THEN 'Adultos que ahorran en una institución financiera (%)'
      ELSE ${TABLE}.serie_nombre
    END ;;
  }

  dimension: serie_id {
    type: string
    label: "Clave del indicador (Banco Mundial)"
    sql: ${TABLE}.serie_id ;;
  }

  dimension: anio {
    type: number
    label: "Año"
    value_format_name: id
    sql: EXTRACT(YEAR FROM ${TABLE}.fecha) ;;
  }

  dimension: es_ultimo_anio {
    type: yesno
    label: "Es el último año disponible"
    description: "Sí en el año más reciente con dato para ese país e indicador. Findex de América Latina llega a 2021; el de los países, a 2024"
    sql: ${TABLE}.es_ultimo ;;
  }

  dimension: valor_anio {
    type: number
    hidden: yes
    sql: ${TABLE}.valor ;;
  }

  measure: valor {
    type: average
    label: "Valor"
    description: "Valor del indicador. Agrupa siempre por Indicador para no mezclar unidades"
    sql: ${valor_anio} ;;
    value_format_name: decimal_2
  }
}
