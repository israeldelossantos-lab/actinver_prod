view: canal_venta {
  sql_table_name: `@{dataset_actinver}.CANAL_VENTA` ;;

  dimension: id_canal_venta {
    primary_key: yes
    type: string
    label: "ID Canal Venta"
    sql: ${TABLE}.ID_CANAL_VENTA ;;
  }

  dimension: segmento {
    type: string
    label: "Segmento Canal Venta"
    sql: ${TABLE}.SEGMENTO ;;
  }

  dimension: subsegmento {
    type: string
    label: "Subsegmento Canal Venta"
    sql: ${TABLE}.SUBSEGMENTO ;;
  }

  dimension: canal_venta_completo {
    type: string
    label: "Canal de Venta (Segmento / Subsegmento)"
    description: "Sustituye CANAL_VENTA vacío con SEGMENTO y SUBSEGMENTO"
    sql: CONCAT(COALESCE(${TABLE}.SEGMENTO, 'SIN SEGMENTO'), ' - ', COALESCE(${TABLE}.SUBSEGMENTO, 'GENERAL')) ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Canales Venta"
  }
}
