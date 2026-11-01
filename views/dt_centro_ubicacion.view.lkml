view: dt_centro_ubicacion {
  derived_table: {
    sql: SELECT
        INITCAP(centro_financiero) AS centro_financiero,
        sucursal_oficial_nombre,
        region_oficial,
        estado,
        direccion_oficial,
        url_maps,
        latitud,
        longitud
      FROM `@{dataset_spine}.cat_sucursales_gps`
      GROUP BY 1, 2, 3, 4, 5, 6, 7, 8 ;;
  }

  dimension: centro_financiero {
    primary_key: yes
    type: string
    label: "Centro Financiero"
    sql: ${TABLE}.centro_financiero ;;
  }

  dimension: sucursal_oficial_nombre {
    type: string
    label: "Sucursal Oficial (Actinver)"
    description: "Nombre oficial verificado en actinver.com"
    sql: ${TABLE}.sucursal_oficial_nombre ;;
  }

  dimension: region_oficial {
    type: string
    label: "Región Oficial (Actinver)"
    description: "Región comercial oficial reportada por Actinver"
    sql: ${TABLE}.region_oficial ;;
  }

  dimension: direccion_oficial {
    type: string
    label: "Dirección Oficial"
    description: "Dirección física oficial de la sucursal"
    sql: ${TABLE}.direccion_oficial ;;
  }

  dimension: url_maps {
    type: string
    label: "Ubicación en Google Maps"
    description: "Enlace directo oficial a Google Maps"
    sql: ${TABLE}.url_maps ;;
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
