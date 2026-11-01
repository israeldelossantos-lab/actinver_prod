view: cat_sucursales_oficiales {
  sql_table_name: `@{dataset_contexto}.cat_sucursales_oficiales_gps` ;;

  dimension: id_sucursal {
    primary_key: yes
    type: number
    label: "ID Sucursal"
    sql: ${TABLE}.id_sucursal ;;
  }

  dimension: nombre_oficial {
    type: string
    label: "Sucursal Oficial"
    description: "Nombre oficial publicado en actinver.com"
    sql: ${TABLE}.nombre_oficial ;;
    link: {
      label: "Abrir en Google Maps"
      url: "{{ cat_sucursales_oficiales.url_maps._value }}"
      icon_url: "https://www.google.com/images/branding/product/ico/maps16_dp.ico"
    }
  }

  dimension: sucursal_corta {
    type: string
    label: "Nombre Corto"
    sql: ${TABLE}.sucursal_corta ;;
  }

  dimension: region_oficial {
    type: string
    label: "Región Comercial (Actinver)"
    description: "Región oficial Actinver (Noroeste, Noreste, Occidente, Centro Bajío, Sureste, Centro y Área Metropolitana)"
    sql: ${TABLE}.region_analitica ;;
  }

  dimension: estado {
    type: string
    label: "Estado"
    sql: ${TABLE}.estado ;;
  }

  dimension: clave_estado_inegi {
    type: string
    label: "Clave Estado (INEGI)"
    sql: ${TABLE}.cve_ent ;;
  }

  dimension: codigo_postal {
    type: string
    label: "Código Postal"
    sql: ${TABLE}.codigo_postal ;;
  }

  dimension: direccion_completa {
    type: string
    label: "Dirección Oficial"
    description: "Dirección física oficial y comprobada"
    sql: ${TABLE}.direccion_completa ;;
  }

  dimension: url_maps {
    type: string
    label: "Enlace Google Maps"
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
    label: "Ubicación Satelital GPS"
    description: "Coordenadas GPS exactas geocodificadas con Google Maps"
    sql_latitude: ${latitud} ;;
    sql_longitude: ${longitud} ;;
  }

  measure: count {
    type: count
    label: "Total Sucursales Físicas"
    drill_fields: [id_sucursal, nombre_oficial, region_oficial, estado, direccion_completa, url_maps]
  }
}
