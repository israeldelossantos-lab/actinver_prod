view: catcentrofinanciero {
  sql_table_name: `@{dataset_actinver}.catcentrofinanciero` ;;

  dimension: id_centro_financiero_cve {
    primary_key: yes
    type: string
    label: "Clave Centro Financiero"
    sql: ${TABLE}.id_centro_financiero_cve ;;
  }

  dimension: id_centro_financiero {
    type: number
    sql: ${TABLE}.id_centro_financiero ;;
  }

  dimension: centro_financiero {
    type: string
    label: "Centro Financiero (Nombre)"
    sql: ${TABLE}.centro_financiero ;;
  }

  dimension: activo {
    type: yesno
    label: "Activo"
    sql: ${TABLE}.activo ;;
  }

  dimension: estado_prefijo {
    type: string
    label: "Estado (Prefijo Centro)"
    description: "Extraído de los primeros caracteres del centro financiero"
    sql: SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] ;;
  }

  dimension: estado_nombre {
    type: string
    label: "Estado Normalizado"
    sql: CASE SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)]
      WHEN 'CDMX' THEN 'Ciudad de México'
      WHEN 'JAL' THEN 'Jalisco'
      WHEN 'NLE' THEN 'Nuevo León'
      WHEN 'YUC' THEN 'Yucatán'
      WHEN 'PUE' THEN 'Puebla'
      WHEN 'QRO' THEN 'Querétaro'
      WHEN 'GTO' THEN 'Guanajuato'
      WHEN 'SON' THEN 'Sonora'
      WHEN 'SLP' THEN 'San Luis Potosí'
      WHEN 'COA' THEN 'Coahuila'
      WHEN 'CHH' THEN 'Chihuahua'
      WHEN 'BCN' THEN 'Baja California'
      WHEN 'ROO' THEN 'Quintana Roo'
      WHEN 'TAB' THEN 'Tabasco'
      WHEN 'MIC' THEN 'Michoacán'
      WHEN 'AGU' THEN 'Aguascalientes'
      WHEN 'MEX' THEN 'Estado de México'
      ELSE 'Otra Entidad'
    END ;;
  }

  measure: count {
    type: count
    label: "Total Centros Financieros"
    value_format_name: decimal_0
  }
}
