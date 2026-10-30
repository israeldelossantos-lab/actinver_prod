view: cliente_producto_09_10_2026 {
  sql_table_name: `@{dataset_cliente_producto}.CLIENTE_PRODUCTO_09_10_2026` ;;

  dimension: customer_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.CUSTOMER_ID ;;
  }

  dimension: customer_id {
    type: string
    label: "ID de Cliente (Tenencia)"
    required_access_grants: [ver_pii]
    sql: ${TABLE}.CUSTOMER_ID ;;
  }

  dimension: has_cuenta_eje {
    type: number
    label: "Tiene Cuenta Eje"
    sql: ${TABLE}.HAS_CUENTA_EJE ;;
  }

  dimension: has_fondos_de_deuda {
    type: number
    label: "Tiene Fondos de Deuda"
    sql: ${TABLE}.HAS_FONDOS_DE_DEUDA ;;
  }

  dimension: has_mercado_de_dinero_reporto {
    type: number
    label: "Tiene Mercado de Dinero Reporto"
    sql: ${TABLE}.HAS_MERCADO_DE_DINERO_REPORTO ;;
  }

  dimension: has_renta_variable {
    type: number
    label: "Tiene Renta Variable"
    sql: ${TABLE}.HAS_RENTA_VARIABLE ;;
  }

  dimension: has_prlv {
    type: number
    label: "Tiene PRLV"
    sql: ${TABLE}.HAS_PRLV ;;
  }

  dimension: has_mercado_de_capitales {
    type: number
    label: "Tiene Mercado de Capitales"
    sql: ${TABLE}.HAS_MERCADO_DE_CAPITALES ;;
  }

  dimension: has_cede {
    type: number
    label: "Tiene CEDE"
    sql: ${TABLE}.HAS_CEDE ;;
  }

  dimension: has_notas_estructuradas {
    type: number
    label: "Tiene Notas Estructuradas"
    sql: ${TABLE}.HAS_NOTAS_ESTRUCTURADAS ;;
  }

  dimension: has_fondos_de_cobertura {
    type: number
    label: "Tiene Fondos de Cobertura"
    sql: ${TABLE}.HAS_FONDOS_DE_COBERTURA ;;
  }

  dimension: has_fondo_de_fondos {
    type: number
    label: "Tiene Fondo de Fondos"
    sql: ${TABLE}.HAS_FONDO_DE_FONDOS ;;
  }

  dimension: has_mexdolar {
    type: number
    label: "Tiene Mexdólar"
    sql: ${TABLE}.HAS_MEXDOLAR ;;
  }

  dimension: has_saving {
    type: number
    label: "Tiene Saving"
    sql: ${TABLE}.HAS_SAVING ;;
  }

  dimension: has_efectivo {
    type: number
    label: "Tiene Efectivo"
    sql: ${TABLE}.HAS_EFECTIVO ;;
  }

  dimension: has_pagare_bursatil {
    type: number
    label: "Tiene Pagaré Bursátil"
    sql: ${TABLE}.HAS_PAGARE_BURSATIL ;;
  }

  dimension: has_credito {
    type: number
    label: "Tiene Crédito"
    sql: ${TABLE}.HAS_CREDITO ;;
  }

  dimension: has_mercado_de_dinero_directo {
    type: number
    label: "Tiene Mercado de Dinero Directo"
    sql: ${TABLE}.HAS_MERCADO_DE_DINERO_DIRECTO ;;
  }

  dimension: has_warrans {
    type: number
    label: "Tiene Warrants"
    sql: ${TABLE}.HAS_WARRANS ;;
  }

  dimension: has_pendiente_por_liquidar {
    type: number
    label: "Tiene Pendiente por Liquidar"
    sql: ${TABLE}.HAS_PENDIENTE_POR_LIQUIDAR ;;
  }

  measure: count {
    type: count
    label: "Total Clientes con Portafolio"
    value_format_name: decimal_0
  }

  measure: penetracion_fondos_deuda {
    type: sum
    label: "Clientes con Fondos de Deuda"
    sql: ${has_fondos_de_deuda} ;;
    value_format_name: decimal_0
  }

  measure: penetracion_reporto {
    type: sum
    label: "Clientes con Dinero Reporto"
    sql: ${has_mercado_de_dinero_reporto} ;;
    value_format_name: decimal_0
  }

  measure: penetracion_renta_variable {
    type: sum
    label: "Clientes con Renta Variable"
    sql: ${has_renta_variable} ;;
    value_format_name: decimal_0
  }

  measure: penetracion_prlv {
    type: sum
    label: "Clientes con PRLV"
    sql: ${has_prlv} ;;
    value_format_name: decimal_0
  }
}
