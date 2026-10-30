view: dt_centro_ubicacion {
  derived_table: {
    sql: SELECT
        INITCAP(centro_financiero) AS centro_financiero,
        CASE
          WHEN UPPER(centro_financiero) LIKE '%CORPORATIVO%' OR UPPER(centro_financiero) LIKE 'BANCA%' THEN NULL
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SAN LUIS POTOSI\b') THEN 22.15
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+AGUASCALIENTES\b') THEN 21.88
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TIJUANA\b') THEN 32.51
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MEXICALI\b') THEN 32.62
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CDMX\b') THEN 19.43
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CHIHUAHUA\b') THEN 28.63
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+JUAREZ\b') THEN 31.69
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SALTILLO\b') THEN 25.42
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TORREON\b') THEN 25.54
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+IRAPUATO\b') THEN 20.67
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+LEON\b') THEN 21.12
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CELAYA\b') THEN 20.52
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+GUADALAJARA\b') THEN 20.67
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+ZAPOPAN\b') THEN 20.72
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MONTERREY\b') THEN 25.69
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SAN PEDRO\b') THEN 25.66
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+PUEBLA\b') THEN 19.04
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+QUERETARO\b') THEN 20.59
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CANCUN\b') THEN 21.16
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CULIACAN\b') THEN 24.81
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MAZATLAN\b') THEN 23.25
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+HERMOSILLO\b') THEN 29.07
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+VERACRUZ\b') THEN 19.17
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+XALAPA\b') THEN 19.54
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MERIDA\b') THEN 20.97
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MORELIA\b') THEN 19.70
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TOLUCA\b') THEN 19.29
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CUERNAVACA\b') THEN 18.92
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+OAXACA\b') THEN 17.07
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+VILLAHERMOSA\b') THEN 17.99
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TAMPICO\b') THEN 22.23
          -- Fallback a centro del estado por prefijo
          WHEN STARTS_WITH(UPPER(centro_financiero), 'CDMX') OR STARTS_WITH(UPPER(centro_financiero), 'DF') THEN 19.43
          WHEN STARTS_WITH(UPPER(centro_financiero), 'JAL') THEN 20.67
          WHEN STARTS_WITH(UPPER(centro_financiero), 'NL') THEN 25.69
          WHEN STARTS_WITH(UPPER(centro_financiero), 'YUC') THEN 20.97
          WHEN STARTS_WITH(UPPER(centro_financiero), 'PUE') THEN 19.04
          WHEN STARTS_WITH(UPPER(centro_financiero), 'QRO') THEN 20.59
          WHEN STARTS_WITH(UPPER(centro_financiero), 'GTO') THEN 21.02
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SON') THEN 29.07
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SLP') THEN 22.15
          WHEN STARTS_WITH(UPPER(centro_financiero), 'COAH') THEN 25.42
          WHEN STARTS_WITH(UPPER(centro_financiero), 'CHIH') THEN 28.63
          WHEN STARTS_WITH(UPPER(centro_financiero), 'BC') THEN 32.51
          WHEN STARTS_WITH(UPPER(centro_financiero), 'QROO') THEN 21.16
          WHEN STARTS_WITH(UPPER(centro_financiero), 'AGS') THEN 21.88
          WHEN STARTS_WITH(UPPER(centro_financiero), 'VER') THEN 19.17
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SIN') THEN 24.81
          WHEN STARTS_WITH(UPPER(centro_financiero), 'MEX') THEN 19.29
          WHEN STARTS_WITH(UPPER(centro_financiero), 'MICH') THEN 19.70
          WHEN STARTS_WITH(UPPER(centro_financiero), 'TAB') THEN 17.99
          ELSE NULL
        END AS latitud,
        CASE
          WHEN UPPER(centro_financiero) LIKE '%CORPORATIVO%' OR UPPER(centro_financiero) LIKE 'BANCA%' THEN NULL
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SAN LUIS POTOSI\b') THEN -100.98
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+AGUASCALIENTES\b') THEN -102.29
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TIJUANA\b') THEN -117.04
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MEXICALI\b') THEN -115.45
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CDMX\b') THEN -99.13
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CHIHUAHUA\b') THEN -106.07
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+JUAREZ\b') THEN -106.42
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SALTILLO\b') THEN -101.00
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TORREON\b') THEN -103.41
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+IRAPUATO\b') THEN -101.35
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+LEON\b') THEN -101.68
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CELAYA\b') THEN -100.81
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+GUADALAJARA\b') THEN -103.35
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+ZAPOPAN\b') THEN -103.39
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MONTERREY\b') THEN -100.32
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+SAN PEDRO\b') THEN -100.40
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+PUEBLA\b') THEN -98.21
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+QUERETARO\b') THEN -100.39
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CANCUN\b') THEN -86.85
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CULIACAN\b') THEN -107.39
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MAZATLAN\b') THEN -106.41
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+HERMOSILLO\b') THEN -110.96
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+VERACRUZ\b') THEN -96.13
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+XALAPA\b') THEN -96.91
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MERIDA\b') THEN -89.62
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+MORELIA\b') THEN -101.19
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TOLUCA\b') THEN -99.66
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+CUERNAVACA\b') THEN -99.23
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+OAXACA\b') THEN -96.72
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+VILLAHERMOSA\b') THEN -92.93
          WHEN REGEXP_CONTAINS(UPPER(centro_financiero), r'^[A-Z]+\s+TAMPICO\b') THEN -97.86
          -- Fallback a centro del estado por prefijo
          WHEN STARTS_WITH(UPPER(centro_financiero), 'CDMX') OR STARTS_WITH(UPPER(centro_financiero), 'DF') THEN -99.13
          WHEN STARTS_WITH(UPPER(centro_financiero), 'JAL') THEN -103.35
          WHEN STARTS_WITH(UPPER(centro_financiero), 'NL') THEN -100.32
          WHEN STARTS_WITH(UPPER(centro_financiero), 'YUC') THEN -89.62
          WHEN STARTS_WITH(UPPER(centro_financiero), 'PUE') THEN -98.21
          WHEN STARTS_WITH(UPPER(centro_financiero), 'QRO') THEN -100.39
          WHEN STARTS_WITH(UPPER(centro_financiero), 'GTO') THEN -101.26
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SON') THEN -110.96
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SLP') THEN -100.98
          WHEN STARTS_WITH(UPPER(centro_financiero), 'COAH') THEN -101.00
          WHEN STARTS_WITH(UPPER(centro_financiero), 'CHIH') THEN -106.07
          WHEN STARTS_WITH(UPPER(centro_financiero), 'BC') THEN -117.04
          WHEN STARTS_WITH(UPPER(centro_financiero), 'QROO') THEN -86.85
          WHEN STARTS_WITH(UPPER(centro_financiero), 'AGS') THEN -102.29
          WHEN STARTS_WITH(UPPER(centro_financiero), 'VER') THEN -96.13
          WHEN STARTS_WITH(UPPER(centro_financiero), 'SIN') THEN -107.39
          WHEN STARTS_WITH(UPPER(centro_financiero), 'MEX') THEN -99.66
          WHEN STARTS_WITH(UPPER(centro_financiero), 'MICH') THEN -101.19
          WHEN STARTS_WITH(UPPER(centro_financiero), 'TAB') THEN -92.93
          ELSE NULL
        END AS longitud
      FROM `@{dataset_spine}.catcentrofinanciero`
      GROUP BY 1, 2, 3 ;;
  }

  dimension: centro_financiero {
    primary_key: yes
    type: string
    label: "Centro Financiero"
    sql: ${TABLE}.centro_financiero ;;
  }

  dimension: latitud {
    type: number
    hidden: yes
    sql: ${TABLE}.latitud ;;
  }

  dimension: longitud {
    type: number
    hidden: yes
    sql: ${TABLE}.longitud ;;
  }

  dimension: ubicacion {
    type: location
    label: "Ubicación Sucursal"
    sql_latitude: ${latitud} ;;
    sql_longitude: ${longitud} ;;
  }
}
