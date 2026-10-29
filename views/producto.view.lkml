view: producto {
  sql_table_name: `@{dataset_actinver}.PRODUCTO` ;;

  dimension: id_producto {
    primary_key: yes
    type: number
    label: "ID Producto Seguros"
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: producto {
    type: string
    label: "Producto de Seguros"
    sql: ${TABLE}.PRODUCTO ;;
  }

  dimension: lob {
    type: string
    label: "Línea de Negocio (LOB)"
    sql: ${TABLE}.LOB ;;
  }

  dimension: sublob {
    type: string
    label: "Sublínea de Negocio (SubLOB)"
    sql: ${TABLE}.SUBLOB ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Catálogo Productos Seguros"
  }
}
