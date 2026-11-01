view: km_perfil_cliente {
  sql_table_name: `@{dataset_cliente_producto}.km_perfil_cliente` ;;

  dimension: customer_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: centroid_id {
    type: number
    label: "ID de Centroide"
    sql: ${TABLE}.centroid_id ;;
  }

  dimension: orden {
    type: number
    hidden: yes
    sql: ${TABLE}.orden ;;
  }

  dimension: perfil {
    type: string
    label: "Perfil de Cliente (K-means)"
    description: "Segmento de cliente determinado por K-means según su tenencia y combinación de productos"
    order_by_field: orden
    sql: ${TABLE}.perfil ;;
  }

  dimension: descripcion {
    type: string
    label: "Descripción del Perfil"
    sql: ${TABLE}.descripcion ;;
  }

  dimension: distancia_centroide {
    type: number
    label: "Distancia al Centroide"
    description: "Distancia euclidiana normalizada al centroide asignado"
    value_format_name: decimal_2
    sql: ${TABLE}.distancia_centroide ;;
  }

  dimension: modelo_version {
    type: date
    label: "Versión del Modelo"
    sql: ${TABLE}.modelo_version ;;
  }

  dimension: pct_perfil_red {
    type: number
    label: "% del Perfil en la Red"
    description: "Participación porcentual del perfil a nivel nacional en la red Actinver"
    value_format: "0.00%"
    sql: CASE ${TABLE}.perfil
           WHEN 'Diversificado' THEN 0.2260
           WHEN 'Cuenta básica' THEN 0.2073
           WHEN 'Con seguro' THEN 0.0620
           WHEN 'Inversionista sofisticado' THEN 0.0339
           WHEN 'Inversión directa' THEN 0.0263
           ELSE 0.4444
         END ;;
  }

  measure: clientes {
    type: count_distinct
    label: "Clientes"
    description: "Total de clientes únicos en el perfil"
    sql: ${customer_id} ;;
    value_format_name: decimal_0
  }

  measure: pct_clientes {
    type: percent_of_total
    label: "% de Clientes"
    description: "Porcentaje de clientes sobre el total del filtro"
    direction: "column"
    sql: ${clientes} ;;
  }
}
