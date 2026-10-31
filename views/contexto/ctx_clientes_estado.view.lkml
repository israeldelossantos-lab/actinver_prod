# Clientes y sucursales de Actinver por entidad federativa, para cruzarlos con la economía de cada estado.
# Se calcula desde el explore de clientes; un cliente con cuentas en sucursales de varios estados cuenta en cada uno.
# Se usa solo en el explore contexto_estatal (from: ctx_estado), por eso las medidas de penetración lo referencian así.
view: ctx_clientes_estado {
  derived_table: {
    explore_source: clientes {
      column: clave_estado_inegi { field: catcentrofinanciero.clave_estado_inegi }
      column: clientes { field: clientes.count }
      column: sucursales { field: catcentrofinanciero.count }
      filters: [catcentrofinanciero.clave_estado_inegi: "-NULL"]
    }
  }
  label: "Estado: Actinver"

  dimension: clave_estado_inegi {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.clave_estado_inegi ;;
  }

  dimension: tiene_sucursal {
    type: yesno
    label: "Tiene sucursal Actinver"
    sql: COALESCE(${TABLE}.sucursales, 0) > 0 ;;
  }

  measure: clientes {
    type: sum
    label: "Clientes Actinver"
    sql: ${TABLE}.clientes ;;
    value_format_name: decimal_0
  }

  measure: sucursales {
    type: sum
    label: "Sucursales Actinver"
    sql: ${TABLE}.sucursales ;;
    value_format_name: decimal_0
  }

  measure: clientes_por_100k {
    type: number
    label: "Clientes Actinver por cada 100 mil habitantes"
    description: "Penetración: clientes entre población del estado, por 100 mil"
    sql: 100000.0 * ${clientes} / NULLIF(${contexto_estatal.poblacion}, 0) ;;
    value_format_name: decimal_1
  }

  measure: clientes_por_mil_mdp_pib {
    type: number
    label: "Clientes Actinver por cada mil millones de pesos de PIB"
    sql: 1000.0 * ${clientes} / NULLIF(${contexto_estatal.pib_mdp}, 0) ;;
    value_format_name: decimal_2
  }
}
