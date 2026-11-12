# SINTÉTICO: saldo por cliente y producto, solo donde la tenencia (CLIENTE_PRODUCTO_09_10_2026) dice que lo tiene.
view: saldo_producto_demo {
  sql_table_name: `@{dataset_copiloto}.saldo_producto_demo` ;;
  label: "Copiloto: saldos (demo)"

  dimension: id_saldo {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id_saldo ;;
  }

  dimension: id_cliente_num {
    hidden: yes
    type: number
    sql: ${TABLE}.id_cliente_num ;;
  }

  dimension: producto {
    type: string
    label: "Producto"
    sql: ${TABLE}.producto ;;
  }

  dimension: familia {
    type: string
    label: "Familia de producto"
    sql: ${TABLE}.familia ;;
  }

  dimension: es_inversion {
    type: yesno
    label: "Es inversión (no crédito)"
    sql: ${TABLE}.es_inversion ;;
  }

  dimension: saldo_mxn {
    type: number
    label: "Saldo (MXN)"
    sql: ${TABLE}.saldo_mxn ;;
    value_format: "$#,##0"
  }

  dimension_group: corte {
    type: time
    timeframes: [date, month]
    datatype: date
    label: "Fecha de corte"
    sql: ${TABLE}.fecha_corte ;;
  }

  measure: saldo_inversion {
    type: sum
    label: "Saldo invertido"
    description: "SINTÉTICO. Suma de saldos de inversión (excluye crédito)"
    sql: ${saldo_mxn} ;;
    filters: [es_inversion: "yes"]
    value_format: "[>=1000000]$0.0,,\" M\";$#,##0"
  }

  measure: saldo_credito {
    type: sum
    label: "Saldo de crédito"
    description: "SINTÉTICO"
    sql: ${saldo_mxn} ;;
    filters: [es_inversion: "no"]
    value_format: "[>=1000000]$0.0,,\" M\";$#,##0"
  }

  measure: clientes_con_saldo {
    type: count_distinct
    label: "Clientes con saldo"
    sql: ${id_cliente_num} ;;
    value_format_name: decimal_0
  }
}
