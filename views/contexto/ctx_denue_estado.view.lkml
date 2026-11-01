view: ctx_denue_estado {
  sql_table_name: `@{dataset_contexto}.v_denue_estado` ;;

  dimension: clave_estado_inegi {
    type: string
    label: "Clave del Estado (INEGI)"
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: estado_nombre {
    type: string
    label: "Estado"
    sql: ${TABLE}.estado_nombre ;;
  }

  dimension: sector {
    type: string
    label: "Sector SCIAN (2 dígitos)"
    sql: ${TABLE}.sector ;;
  }

  dimension: sector_nombre {
    type: string
    label: "Sector Económico"
    sql: ${TABLE}.sector_nombre ;;
  }

  dimension: tamano {
    type: string
    label: "Tamaño de Empresa"
    description: "Micro (1-10 personas), Pequeña (11-50), Mediana (51-250), Grande (251+)"
    order_by_field: estrato_orden
    sql: ${TABLE}.tamano ;;
  }

  dimension: estrato_orden {
    type: number
    label: "Estrato (Orden)"
    sql: ${TABLE}.estrato_orden ;;
  }

  measure: establecimientos {
    type: sum
    label: "Total Establecimientos"
    sql: ${TABLE}.establecimientos ;;
    value_format_name: decimal_0
  }

  measure: medianas {
    type: sum
    label: "Empresas Medianas"
    description: "Establecimientos de 51 a 250 personas"
    sql: CASE WHEN ${tamano} = 'Mediana' THEN ${TABLE}.establecimientos ELSE 0 END ;;
    value_format_name: decimal_0
  }

  measure: grandes {
    type: sum
    label: "Empresas Grandes"
    description: "Establecimientos de 251 y más personas"
    sql: CASE WHEN ${tamano} = 'Grande' THEN ${TABLE}.establecimientos ELSE 0 END ;;
    value_format_name: decimal_0
  }

  measure: prospectos_51_mas {
    type: sum
    label: "Prospectos Empresariales (51+ personas)"
    description: "Suma de empresas medianas y grandes (potenciales clientes patrimoniales y corporativos)"
    sql: CASE WHEN ${estrato_orden} >= 5 THEN ${TABLE}.establecimientos ELSE 0 END ;;
    value_format_name: decimal_0
  }
}
