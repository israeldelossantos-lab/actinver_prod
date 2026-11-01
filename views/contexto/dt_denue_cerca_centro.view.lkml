view: dt_denue_cerca_centro {
  derived_table: {
    sql:
      SELECT
        c.centro_financiero,
        COUNTIF(d.tamano = 'Mediana') AS medianas_5km,
        COUNTIF(d.tamano = 'Grande') AS grandes_5km,
        COUNTIF(d.estrato_orden >= 5) AS prospectos_5km,
        APPROX_TOP_COUNT(d.sector_nombre, 1)[OFFSET(0)].value AS sector_principal_5km
      FROM ${dt_centro_ubicacion.SQL_TABLE_NAME} c
      JOIN `@{dataset_contexto}.denue_establecimientos` d
        ON c.latitud IS NOT NULL AND c.longitud IS NOT NULL
        AND d.ubicacion IS NOT NULL
        AND ST_DWITHIN(d.ubicacion, ST_GEOGPOINT(c.longitud, c.latitud), 5000)
      GROUP BY c.centro_financiero ;;
  }

  dimension: centro_financiero {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.centro_financiero ;;
  }

  dimension: sector_principal_5km {
    type: string
    label: "Sector Principal a 5 km (DENUE)"
    description: "Sector económico predominante entre las unidades económicas en un radio de 5 km"
    sql: ${TABLE}.sector_principal_5km ;;
  }

  measure: medianas_5km {
    type: max
    label: "Empresas Medianas a 5 km"
    description: "Establecimientos medianos (51 a 250 personas) a menos de 5 km de la sucursal"
    sql: ${TABLE}.medianas_5km ;;
    value_format_name: decimal_0
  }

  measure: grandes_5km {
    type: max
    label: "Empresas Grandes a 5 km"
    description: "Establecimientos grandes (251+ personas) a menos de 5 km de la sucursal"
    sql: ${TABLE}.grandes_5km ;;
    value_format_name: decimal_0
  }

  measure: prospectos_5km {
    type: max
    label: "Prospectos a 5 km (51+ personas)"
    description: "Empresas medianas y grandes en un radio de 5 km de la sucursal Actinver"
    sql: ${TABLE}.prospectos_5km ;;
    value_format_name: decimal_0
  }
}
