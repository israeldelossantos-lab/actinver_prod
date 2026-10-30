connection: "claro_video_bigquery"

include: "/views/**/*.view.lkml"
include: "/dashboards/**/*.dashboard.lookml"

# ----------------------------------------------------
# CONFIGURACIÓN GLOBAL: DATAGROUP Y CONTROL DE ACCESO (CLS)
# ----------------------------------------------------
datagroup: actinver_diario {
  max_cache_age: "24 hours"
}

persist_with: actinver_diario

access_grant: ver_pii {
  user_attribute: ver_pii
  allowed_values: ["si"]
}

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
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${cuenta.id_cliente} AS STRING) ;;
    relationship: one_to_many
  }

  join: cliente_producto_09_10_2026 {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = ${cliente_producto_09_10_2026.customer_key} ;;
    relationship: one_to_one
  }

  join: dt_escalera_vinculacion {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = ${dt_escalera_vinculacion.customer_key} ;;
    relationship: one_to_one
  }

  join: dt_siguiente_producto_sugerido {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = ${dt_siguiente_producto_sugerido.customer_id} ;;
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
    required_joins: [cuenta]
  }

  join: catcanaloriginacion {
    type: left_outer
    sql_on: CAST(${cuenta.id_canal_originacion} AS STRING) = ${catcanaloriginacion.id_tipo_canal_originacion_cve} ;;
    relationship: many_to_one
    required_joins: [cuenta]
  }

  join: cattipocontrato {
    type: left_outer
    sql_on: ${cuenta.id_tipo_contrato} = ${cattipocontrato.id_tipo_contrato} ;;
    relationship: many_to_one
    required_joins: [cuenta]
  }
}

# ----------------------------------------------------
# 2. EXPLORE: PÓLIZAS Y SEGUROS
# ----------------------------------------------------
explore: polizas {
  label: "2. Pólizas y Seguros"
  description: "Cartera de seguros, puntualidad de cobranza, vencimientos y domiciliación"
  sql_always_where: ${polizas.baja_logica} = 0 ;;

  join: dt_poliza {
    type: left_outer
    sql_on: ${polizas.poliza_key} = ${dt_poliza.poliza} ;;
    relationship: many_to_one
  }

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
    sql_on: ${polizas.poliza_key} = ${poliza_asesor.poliza} AND ${poliza_asesor.baja_logica} = 0 ;;
    relationship: one_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: ${poliza_asesor.numero_asesor} = ${catasesor.id_asesor_cve} ;;
    relationship: many_to_one
  }

  join: kardex {
    type: left_outer
    sql_on: LTRIM(CAST(${poliza_asesor.numero_asesor} AS STRING), '0') = ${kardex.nomina} ;;
    relationship: many_to_one
  }

  join: domiciliado {
    type: left_outer
    sql_on: ${polizas.poliza_key} = ${domiciliado.poliza} AND ${domiciliado.baja_logica} = 0 ;;
    relationship: one_to_one
  }

  join: dt_vencimientos_seguros {
    type: left_outer
    sql_on: ${polizas.poliza_key} = ${dt_vencimientos_seguros.poliza} ;;
    relationship: one_to_one
  }
}

# ----------------------------------------------------
# 3. EXPLORE: PRIMAS
# ----------------------------------------------------
explore: primas {
  from: prima_emitida_2026
  label: "3. Primas Emitidas (Seguros)"
  description: "Emisión de primas y facturación técnica de seguros"
  sql_always_where: ${primas.baja_logica} = 0 ;;

  join: dt_poliza {
    type: left_outer
    sql_on: ${primas.poliza_key} = ${dt_poliza.poliza} ;;
    relationship: many_to_one
  }

  join: producto {
    type: left_outer
    sql_on: ${primas.id_producto} = ${producto.id_producto} ;;
    relationship: many_to_one
  }

  join: canal_venta {
    type: left_outer
    sql_on: ${dt_poliza.id_canal_venta} = ${canal_venta.id_canal_venta} ;;
    relationship: many_to_one
  }

  join: poliza_asesor {
    type: left_outer
    sql_on: ${primas.poliza_key} = ${poliza_asesor.poliza} AND ${poliza_asesor.baja_logica} = 0 ;;
    relationship: many_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: LTRIM(CAST(${poliza_asesor.numero_asesor} AS STRING), '0') = LTRIM(CAST(${catasesor.id_asesor_cve} AS STRING), '0') ;;
    relationship: many_to_one
  }

  join: kardex {
    type: left_outer
    sql_on: LTRIM(CAST(${poliza_asesor.numero_asesor} AS STRING), '0') = ${kardex.nomina} ;;
    relationship: many_to_one
  }

  join: domiciliado {
    type: left_outer
    sql_on: ${primas.poliza_key} = ${domiciliado.poliza} AND ${domiciliado.baja_logica} = 0 ;;
    relationship: many_to_one
  }
}

# ----------------------------------------------------
# 4. EXPLORE: COBRANZA Y DESVIACIÓN DE PAGO
# ----------------------------------------------------
explore: cobranza {
  from: dt_desviacion_pago
  label: "4. Cobranza y Desviación de Pago (Seguros)"
  description: "Análisis de puntualidad, días de desviación y morosidad por recibo de pago"

  join: dt_poliza {
    type: left_outer
    sql_on: ${cobranza.poliza_key} = ${dt_poliza.poliza} ;;
    relationship: many_to_one
  }

  join: producto {
    type: left_outer
    sql_on: ${dt_poliza.id_producto} = ${producto.id_producto} ;;
    relationship: many_to_one
  }

  join: canal_venta {
    type: left_outer
    sql_on: ${dt_poliza.id_canal_venta} = ${canal_venta.id_canal_venta} ;;
    relationship: many_to_one
  }

  join: poliza_asesor {
    type: left_outer
    sql_on: ${cobranza.poliza_key} = ${poliza_asesor.poliza} AND ${poliza_asesor.baja_logica} = 0 ;;
    relationship: many_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: LTRIM(CAST(${poliza_asesor.numero_asesor} AS STRING), '0') = LTRIM(CAST(${catasesor.id_asesor_cve} AS STRING), '0') ;;
    relationship: many_to_one
  }

  join: kardex {
    type: left_outer
    sql_on: LTRIM(CAST(${poliza_asesor.numero_asesor} AS STRING), '0') = ${kardex.nomina} ;;
    relationship: many_to_one
  }

  join: domiciliado {
    type: left_outer
    sql_on: ${cobranza.poliza_key} = ${domiciliado.poliza} AND ${domiciliado.baja_logica} = 0 ;;
    relationship: many_to_one
  }
}

# ----------------------------------------------------
# 5. EXPLORE: AFINIDAD DE PRODUCTOS (CROSS-SELL)
# ----------------------------------------------------
explore: afinidad_productos {
  from: dt_afinidad_productos
  label: "5. Afinidad de Productos (Cross-Sell)"
  description: "Matriz de co-ocurrencia, confianza y lift entre productos de inversión"
}


# ----------------------------------------------------
# 6. EXPLORE: CALIDAD DE DATOS (TRANSVERSAL)
# ----------------------------------------------------
explore: calidad_datos {
  label: "6. Calidad de Datos (Transversal)"
  description: "Matriz de reglas de integridad, consistencia y observabilidad de datos en Actinver"
}
