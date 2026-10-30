view: producto {
  sql_table_name: `@{dataset_seguros}.PRODUCTO` ;;

  dimension: id_producto {
    primary_key: yes
    type: number
    label: "ID Producto"
    sql: ${TABLE}.ID_PRODUCTO ;;
  }

  dimension: id_lob {
    type: number
    label: "ID LOB"
    sql: ${TABLE}.ID_LOB ;;
  }

  dimension: lob {
    type: string
    label: "Línea de Negocio (LOB)"
    sql: ${TABLE}.LOB ;;
  }

  dimension: ramo {
    type: string
    label: "Ramo de Seguro"
    sql: ${lob} ;;
  }

  dimension: id_sublob {
    type: number
    label: "ID Sub LOB"
    sql: ${TABLE}.ID_SUBLOB ;;
  }

  dimension: sublob {
    type: string
    label: "Sub Línea de Negocio"
    sql: ${TABLE}.SUBLOB ;;
  }

  dimension: producto {
    type: string
    label: "Producto de Seguro"
    sql: ${TABLE}.PRODUCTO ;;
  }

  dimension: baja_logica {
    type: number
    sql: ${TABLE}.BAJA_LOGICA ;;
  }

  measure: count {
    type: count
    label: "Total Productos Seguro"
  }
}
