# Historia mensual de los indicadores de Banxico (promedio del mes; inflación, INPC e IPC: último dato del mes; volumen IPC: suma del mes).
# Fuente: contexto_externo.banxico_mensual (una fila por serie y mes, desde 2015).
view: ctx_banxico_mensual {
  sql_table_name: `@{dataset_contexto}.banxico_mensual` ;;
  label: "Mercado: historia mensual"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.serie_id, '|', CAST(${TABLE}.fecha AS STRING)) ;;
  }

  dimension: serie_id {
    type: string
    label: "Clave de serie (Banxico SIE)"
    sql: ${TABLE}.serie_id ;;
  }

  dimension: indicador {
    type: string
    label: "Indicador"
    description: "Nombre corto del indicador de Banxico (tasas, CETES, dólar, inflación, IPC y sectores BMV)"
    sql: CASE ${TABLE}.serie_id
      WHEN 'SF61745' THEN 'Tasa objetivo'
      WHEN 'SF60648' THEN 'TIIE 28'
      WHEN 'SF60633' THEN 'CETES 28'
      WHEN 'SF60634' THEN 'CETES 91'
      WHEN 'SF43718' THEN 'Dólar FIX'
      WHEN 'SP30578' THEN 'Inflación anual'
      WHEN 'SP1' THEN 'INPC'
      WHEN 'SF43716' THEN 'IPC'
      WHEN 'SF43713' THEN 'IPC máximo'
      WHEN 'SF43714' THEN 'IPC mínimo'
      WHEN 'SF43715' THEN 'IPC volumen'
      WHEN 'SF4782' THEN 'IPC mensual'
      WHEN 'SF364756' THEN 'Materiales'
      WHEN 'SF364757' THEN 'Industrial'
      WHEN 'SF364758' THEN 'Consumo no básico'
      WHEN 'SF364759' THEN 'Consumo frecuente'
      WHEN 'SF364760' THEN 'Financieros'
      WHEN 'SF364761' THEN 'Telecomunicaciones'
      ELSE ${TABLE}.serie_nombre
    END ;;
  }

  dimension: unidad {
    type: string
    label: "Unidad"
    sql: CASE
      WHEN ${TABLE}.serie_id IN ('SF61745', 'SF60648', 'SF60633', 'SF60634', 'SP30578') THEN 'Porcentaje'
      WHEN ${TABLE}.serie_id = 'SF43718' THEN 'Pesos por dólar'
      ELSE 'Índice'
    END ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [month, quarter, year]
    datatype: date
    label: "Periodo"
    sql: ${TABLE}.fecha ;;
  }

  dimension: mes_completo {
    type: yesno
    label: "Mes completo"
    description: "No para el mes en curso: su valor todavía puede cambiar"
    sql: ${TABLE}.mes_completo ;;
  }

  dimension: valor_mes {
    type: number
    hidden: yes
    sql: ${TABLE}.valor ;;
  }

  measure: valor {
    type: average
    label: "Valor"
    description: "Valor del indicador en el periodo (promedio mensual para tasas/dólar, cierre de mes para inflación/IPC, suma para volumen). Agrupa siempre por Indicador para no mezclar unidades"
    sql: ${valor_mes} ;;
    value_format_name: decimal_2
  }

  measure: valor_maximo {
    type: max
    label: "Valor máximo"
    sql: ${valor_mes} ;;
    value_format_name: decimal_2
  }

  measure: valor_minimo {
    type: min
    label: "Valor mínimo"
    sql: ${valor_mes} ;;
    value_format_name: decimal_2
  }
}
