connection: "claro_video_bigquery"

include: "/views/**/*.view.lkml"
include: "/dashboards/**/*.dashboard.lookml"

# ----------------------------------------------------
# 1. EXPLORE: CLIENTES E INVERSIONES (VISIÓN 360)
# ----------------------------------------------------
explore: clientes {
  from: cliente
  label: "1. Clientes e Inversiones (360)"
  description: "Visión integral de clientes, vinculación de productos, cuentas, asesores, centros financieros y seguros cruzados"

  join: persona {
    type: left_outer
    sql_on: ${clientes.id_persona} = ${persona.id_persona} ;;
    relationship: many_to_one
  }

  join: cuenta {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_num} AS STRING) = CAST(${cuenta.id_cliente} AS STRING) ;;
    relationship: one_to_many
  }

  join: cliente_producto_09_10_2026 {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_num} AS STRING) = ${cliente_producto_09_10_2026.customer_id} ;;
    relationship: one_to_one
  }

  join: dt_escalera_vinculacion {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_num} AS STRING) = ${dt_escalera_vinculacion.customer_id} ;;
    relationship: one_to_one
  }

  join: dt_siguiente_producto_sugerido {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_num} AS STRING) = ${dt_siguiente_producto_sugerido.customer_id} ;;
    relationship: one_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: ${clientes.id_asesor} = ${catasesor.id_asesor_cve} ;;
    relationship: many_to_one
  }

  join: catcentrofinanciero {
    type: left_outer
    sql_on: ${cuenta.id_centro_financiero} = ${catcentrofinanciero.id_centro_financiero_cve} ;;
    relationship: many_to_one
  }

  join: dim_sucursales {
    type: left_outer
    sql_on: ${dim_sucursales.estado} = ${catcentrofinanciero.estado_nombre} ;;
    relationship: many_to_one
  }

  join: catcanaloriginacion {
    type: left_outer
    sql_on: ${cuenta.id_canal_originacion} = ${catcanaloriginacion.id_tipo_canal_originacion} ;;
    relationship: many_to_one
  }

  join: cattipocontrato {
    type: left_outer
    sql_on: ${cuenta.id_tipo_contrato} = ${cattipocontrato.id_tipo_contrato} ;;
    relationship: many_to_one
  }

  join: polizas {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_num} AS STRING) = CAST(${polizas.id_numero_relacion} AS STRING)
      AND ${polizas.baja_logica} = 0 ;;
    relationship: one_to_many
  }
}

# ----------------------------------------------------
# 2. EXPLORE: PÓLIZAS Y SEGUROS
# ----------------------------------------------------
explore: polizas {
  label: "2. Pólizas y Seguros"
  description: "Cartera de seguros, puntualidad de cobranza, vencimientos y domiciliación"
  sql_always_where: ${polizas.baja_logica} = 0 ;;

  join: producto {
    type: left_outer
    sql_on: ${polizas.id_producto} = ${producto.id_producto} ;;
    relationship: many_to_one
  }

  join: canal_venta {
    type: left_outer
    sql_on: ${polizas.id_canal_venta} = ${canal_venta.id_canal_venta} ;;
    relationship: many_to_one
  }

  join: tipo_poliza {
    type: left_outer
    sql_on: ${polizas.id_tipo_poliza} = ${tipo_poliza.id_tipo_poliza} ;;
    relationship: many_to_one
  }

  join: tipo_transaccion {
    type: left_outer
    sql_on: ${polizas.id_tipo_transaccion} = ${tipo_transaccion.id_tipo_transaccion} ;;
    relationship: many_to_one
  }

  join: via_pago {
    type: left_outer
    sql_on: ${polizas.id_via_pago} = ${via_pago.id_via_pago} ;;
    relationship: many_to_one
  }

  join: origen {
    type: left_outer
    sql_on: ${polizas.id_origen} = ${origen.id_origen} ;;
    relationship: many_to_one
  }

  join: poliza_asesor {
    type: left_outer
    sql_on: ${polizas.poliza} = ${poliza_asesor.poliza} AND ${poliza_asesor.baja_logica} = 0 ;;
    relationship: one_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: ${poliza_asesor.numero_asesor} = ${catasesor.id_asesor_cve} ;;
    relationship: many_to_one
  }

  join: kardex {
    type: left_outer
    sql_on: ${catasesor.id_asesor_cve} = ${kardex.nomina} ;;
    relationship: many_to_one
  }

  join: domiciliado {
    type: left_outer
    sql_on: ${polizas.poliza} = ${domiciliado.poliza} AND ${domiciliado.baja_logica} = 0 ;;
    relationship: one_to_one
  }

  join: dt_vencimientos_seguros {
    type: left_outer
    sql_on: ${polizas.poliza} = ${dt_vencimientos_seguros.poliza} ;;
    relationship: one_to_one
  }

  join: cliente {
    type: left_outer
    sql_on: CAST(${polizas.id_numero_relacion} AS STRING) = CAST(${cliente.id_cliente_num} AS STRING) ;;
    relationship: many_to_one
  }
}

# ----------------------------------------------------
# 3. EXPLORE: PRIMAS Y COBRANZA
# ----------------------------------------------------
explore: primas {
  from: prima_emitida_2026
  label: "3. Primas y Cobranza"
  description: "Emisión de primas, cobranza pagada y análisis de morosidad"
  sql_always_where: ${primas.baja_logica} = 0 ;;

  join: polizas {
    type: left_outer
    sql_on: ${primas.poliza} = ${polizas.poliza} AND ${polizas.baja_logica} = 0 ;;
    relationship: many_to_one
  }

  join: producto {
    type: left_outer
    sql_on: ${primas.id_producto} = ${producto.id_producto} ;;
    relationship: many_to_one
  }

  join: canal_venta {
    type: left_outer
    sql_on: ${polizas.id_canal_venta} = ${canal_venta.id_canal_venta} ;;
    relationship: many_to_one
  }

  join: dt_desviacion_pago {
    type: left_outer
    sql_on: ${primas.poliza} = ${dt_desviacion_pago.poliza} ;;
    relationship: one_to_many
  }

  join: poliza_asesor {
    type: left_outer
    sql_on: ${primas.poliza} = ${poliza_asesor.poliza} AND ${poliza_asesor.baja_logica} = 0 ;;
    relationship: many_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: ${poliza_asesor.numero_asesor} = ${catasesor.id_asesor_cve} ;;
    relationship: many_to_one
  }

  join: domiciliado {
    type: left_outer
    sql_on: ${primas.poliza} = ${domiciliado.poliza} AND ${domiciliado.baja_logica} = 0 ;;
    relationship: many_to_one
  }
}

# ----------------------------------------------------
# 4. EXPLORE: AFINIDAD DE PRODUCTOS (CROSS-SELL)
# ----------------------------------------------------
explore: afinidad_productos {
  from: dt_afinidad_productos
  label: "4. Afinidad de Productos (Cross-Sell)"
  description: "Matriz de co-ocurrencia, confianza y lift entre productos de inversión"
}
