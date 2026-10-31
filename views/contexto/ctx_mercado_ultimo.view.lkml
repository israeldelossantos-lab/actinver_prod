# Valor más reciente de cada indicador de Banxico y su cambio contra hace 1 y 12 meses.
# Fuente: vista contexto_externo.v_mercado_ultimo (una fila por serie, último dato diario/semanal/mensual).
view: ctx_mercado_ultimo {
  sql_table_name: `@{dataset_contexto}.v_mercado_ultimo` ;;
  label: "Mercado: valor actual"

  dimension: serie_id {
    primary_key: yes
    type: string
    label: "Clave de serie (Banxico SIE)"
    sql: ${TABLE}.serie_id ;;
  }

  dimension: indicador {
    type: string
    label: "Indicador"
    description: "Tasa objetivo, TIIE 28, CETES 28, CETES 91, Dólar FIX, Inflación anual o INPC"
    sql: ${TABLE}.serie_nombre_corto ;;
  }

  dimension: unidad {
    type: string
    label: "Unidad"
    description: "Las tasas y la inflación anual están en %; el dólar en pesos por dólar; el INPC es un índice"
    sql: CASE WHEN ${TABLE}.serie_id = 'SP30578' THEN 'Porcentaje' ELSE ${TABLE}.unidad END ;;
  }

  dimension: fecha_dato {
    type: date
    label: "Fecha del dato"
    sql: ${TABLE}.fecha_actual ;;
  }

  dimension: es_tasa {
    type: yesno
    label: "Es tasa o porcentaje"
    description: "Sí para tasas e inflación anual: sus cambios se expresan en puntos base"
    sql: ${TABLE}.serie_id IN ('SF61745', 'SF60648', 'SF60633', 'SF60634', 'SP30578') ;;
  }

  measure: valor_actual {
    type: max
    label: "Valor actual"
    description: "Último valor publicado. Úsalo filtrando o agrupando por Indicador"
    sql: ${TABLE}.valor_actual ;;
    value_format_name: decimal_2
  }

  measure: valor_hace_1_mes {
    type: max
    label: "Valor hace 1 mes"
    sql: ${TABLE}.valor_hace_1_mes ;;
    value_format_name: decimal_2
  }

  measure: valor_hace_12_meses {
    type: max
    label: "Valor hace 12 meses"
    sql: ${TABLE}.valor_hace_12_meses ;;
    value_format_name: decimal_2
  }

  measure: cambio_1_mes {
    type: max
    label: "Cambio en 1 mes"
    description: "En puntos base para tasas e inflación; en % para dólar e INPC"
    sql: ${TABLE}.cambio_1_mes ;;
    value_format_name: decimal_1
  }

  measure: cambio_12_meses {
    type: max
    label: "Cambio en 12 meses"
    description: "En puntos base para tasas e inflación; en % para dólar e INPC"
    sql: ${TABLE}.cambio_12_meses ;;
    value_format_name: decimal_1
  }
}
