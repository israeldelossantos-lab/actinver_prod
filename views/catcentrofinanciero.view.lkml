view: catcentrofinanciero {
  sql_table_name: `@{dataset_spine}.catcentrofinanciero` ;;

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
    sql: INITCAP(${TABLE}.centro_financiero) ;;
    link: {
      label: "Ver clientes de la sucursal"
      url: "/dashboards/actinver::sucursal_detalle?Centro+financiero={{ value | url_encode }}"
    }
  }

  dimension: activo {
    type: yesno
    label: "Activo"
    sql: ${TABLE}.activo ;;
  }

  dimension: tipo_centro {
    type: string
    label: "Tipo de Centro"
    description: "Clasificación entre Sucursal, Corporativo y Banca patrimonial/privada"
    sql: CASE
      WHEN ${TABLE}.centro_financiero LIKE '%CORPORATIVO%' THEN 'Corporativo'
      WHEN ${TABLE}.centro_financiero LIKE 'BANCA%' THEN 'Banca patrimonial/privada'
      ELSE 'Sucursal'
    END ;;
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
    map_layer_name: mexico_estados
    link: {
      label: "Ver sucursales de {{ value }}"
      url: "/dashboards/actinver::desempeno_sucursales?Estado={{ value | url_encode }}"
    }
    sql: CASE
      WHEN ${TABLE}.centro_financiero LIKE '%CORPORATIVO%' OR ${TABLE}.centro_financiero LIKE 'BANCA%' THEN 'Sin ubicación física'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] IN ('CDMX', 'DF') THEN 'Ciudad de México'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'JAL' THEN 'Jalisco'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'NL' THEN 'Nuevo León'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'YUC' THEN 'Yucatán'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'PUE' THEN 'Puebla'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'QRO' THEN 'Querétaro'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'GTO' THEN 'Guanajuato'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SON' THEN 'Sonora'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SLP' THEN 'San Luis Potosí'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'COAH' THEN 'Coahuila'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'CHIH' THEN 'Chihuahua'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'BC' THEN 'Baja California'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'QROO' THEN 'Quintana Roo'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'AGS' THEN 'Aguascalientes'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'VER' THEN 'Veracruz'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SIN' THEN 'Sinaloa'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'MEX' THEN 'Estado de México'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'MICH' THEN 'Michoacán'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'TAB' THEN 'Tabasco'
      ELSE 'Otra Entidad'
    END ;;
  }

  dimension: clave_estado_inegi {
    type: string
    label: "Clave Estado INEGI (2 dígitos)"
    description: "Clave de entidad federativa según INEGI para cruces geográficos"
    sql: CASE
      WHEN ${TABLE}.centro_financiero LIKE '%CORPORATIVO%' OR ${TABLE}.centro_financiero LIKE 'BANCA%' THEN NULL
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] IN ('CDMX', 'DF') THEN '09'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'JAL' THEN '14'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'NL' THEN '19'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'YUC' THEN '31'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'PUE' THEN '21'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'QRO' THEN '22'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'GTO' THEN '11'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SON' THEN '26'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SLP' THEN '24'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'COAH' THEN '05'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'CHIH' THEN '08'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'BC' THEN '02'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'QROO' THEN '23'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'AGS' THEN '01'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'VER' THEN '30'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'SIN' THEN '25'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'MEX' THEN '15'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'MICH' THEN '16'
      WHEN SPLIT(${TABLE}.centro_financiero, ' ')[OFFSET(0)] = 'TAB' THEN '27'
      ELSE NULL
    END ;;
  }

  measure: count {
    type: count
    label: "Total Centros Financieros"
    value_format_name: decimal_0
  }
}
