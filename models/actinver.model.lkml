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



# CAPA DE MAPA: ESTADOS DE MÉXICO (TOPOJSON)
# ----------------------------------------------------

map_layer: mexico_estados {
  label: "México (estados)"
  file: "/maps/mexico_estados.topojson"
  format: topojson
  property_key: "state_name"
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

  join: dt_centro_ubicacion {
    type: left_outer
    sql_on: ${catcentrofinanciero.centro_financiero} = ${dt_centro_ubicacion.centro_financiero} ;;
    relationship: many_to_one
    required_joins: [catcentrofinanciero]
  }

  join: dt_tenencia_familia {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = ${dt_tenencia_familia.customer_id} ;;
    relationship: one_to_many
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

  # Copiloto: datos de demostración
  join: cliente_nombre_demo {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${cliente_nombre_demo.id_cliente_num} AS STRING) ;;
    relationship: one_to_one
  }

  join: asesor_nombre_demo {
    type: left_outer
    sql_on: CAST(${clientes.id_asesor} AS STRING) = CAST(${asesor_nombre_demo.id_asesor_cve} AS STRING) ;;
    relationship: many_to_one
  }

  join: saldo_producto_demo {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${saldo_producto_demo.id_cliente_num} AS STRING) ;;
    relationship: one_to_many
  }

  join: vencimiento_inversion {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${vencimiento_inversion.id_cliente_num} AS STRING) ;;
    relationship: one_to_many
  }

  join: dt_ultimo_contacto {
    from: dt_ultimo_contacto
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${dt_ultimo_contacto.id_cliente_num} AS STRING) ;;
    relationship: one_to_one
  }

  join: contacto_asesor {
    type: left_outer
    sql_on: CAST(${clientes.id_cliente_key} AS STRING) = CAST(${contacto_asesor.id_cliente_num} AS STRING) ;;
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

# ----------------------------------------------------
# CONTEXTO EXTERNO: fuentes públicas en vertex-ia-503623.contexto_externo
# (Banxico, INEGI, DataMéxico, Banco Mundial). Se actualizan con la ingesta de ingesta_contexto/.
# ----------------------------------------------------

# 7. MERCADO: tasas, CETES, tipo de cambio e inflación de Banxico
explore: mercado_mexico {
  from: ctx_banxico_mensual
  label: "7. Mercado (Banxico)"
  description: "Tasa objetivo, TIIE 28, CETES 28 y 91, dólar FIX, inflación anual e INPC de Banco de México. Historia mensual desde 2015 y el valor más reciente con su cambio a 1 y 12 meses. Para el valor actual usa los campos de 'Mercado: valor actual'"

  join: ctx_mercado_ultimo {
    type: left_outer
    sql_on: ${mercado_mexico.serie_id} = ${ctx_mercado_ultimo.serie_id} ;;
    relationship: many_to_one
  }
}

# 8. MÉXICO FRENTE AL MUNDO: Banco Mundial (WDI y Global Findex)
explore: mexico_mundo {
  from: ctx_indicadores_mundo
  label: "8. México frente al mundo (Banco Mundial)"
  description: "Crecimiento del PIB, inflación, PIB per cápita, población y adultos con cuenta financiera (Findex) de México comparado con Brasil, Chile, Colombia, Perú, América Latina y el Mundo. Datos anuales"
}

# 9. CONTEXTO POR ESTADO: economía de cada estado frente a los clientes y sucursales de Actinver
explore: contexto_estatal {
  from: ctx_estado
  label: "9. Contexto por estado (INEGI y DataMéxico)"
  description: "Una fila por estado: PIB, población, ingreso de los hogares, salario, inversión extranjera y desocupación, junto con los clientes y sucursales de Actinver y su penetración (clientes por 100 mil habitantes). Sirve para encontrar estados con potencial y sin sucursal"

  join: ctx_clientes_estado {
    type: left_outer
    sql_on: ${contexto_estatal.clave_estado_inegi} = ${ctx_clientes_estado.clave_estado_inegi} ;;
    relationship: one_to_one
  }
}

# 10. SUCURSALES OFICIALES: 48 sucursales físicas oficiales de actinver.com con coordenadas GPS
explore: sucursales_oficiales {
  from: cat_sucursales_oficiales
  label: "10. Sucursales Oficiales (Actinver)"
  description: "Catálogo oficial de las 48 sucursales físicas de Actinver en México con ubicación satelital GPS verificada, enlaces directos a Google Maps y región comercial"
}

# ----------------------------------------------------
# SEGUROS: mercado asegurador mexicano (CNSF) en vertex-ia-503623.contexto_externo
# ----------------------------------------------------

# 11. MERCADO DE SEGUROS (CNSF): tamaño por ramo y estado, siniestralidad y agentes
explore: mercado_seguros {
  from: ctx_cnsf_mercado_ramo
  label: "11. Mercado de Seguros (CNSF Benchmark)"
  description: "Tamaño del mercado asegurador mexicano por ramo y estado (2015-2025), siniestralidad sectorial y fuerza de agentes por estado"

  join: ctx_cnsf_mercado_entidad {
    type: left_outer
    sql_on: ${mercado_seguros.anio} = ${ctx_cnsf_mercado_entidad.anio}
        AND ${mercado_seguros.ramo_normalizado} = ${ctx_cnsf_mercado_entidad.ramo_normalizado} ;;
    relationship: one_to_many
  }

  join: ctx_cnsf_agentes_entidad {
    type: left_outer
    sql_on: ${ctx_cnsf_mercado_entidad.clave_estado_inegi} = ${ctx_cnsf_agentes_entidad.clave_estado_inegi} ;;
    relationship: many_to_one
  }
}

# 12. ACTINVER VS MERCADO: explore propio (la vista ya trae la prima del mercado 2025).
# Unirla a mercado_seguros por ramo repetía la prima de Actinver una vez por año (11 años).
explore: actinver_vs_mercado {
  from: ctx_actinver_vs_mercado_ramo
  label: "12. Actinver vs Mercado (CNSF)"
  description: "Prima Actinver anualizada contra el cierre CNSF 2025 por ramo. Incluye MME sin ramo asignado."
}

# 13. ASEGURADORAS: ranking, primas, siniestralidad y utilidad por institución (CNSF)
explore: aseguradoras_cnsf {
  from: ctx_cnsf_ranking_aseguradoras
  label: "13. Aseguradoras (CNSF)"
  description: "Ranking de aseguradoras por prima, con siniestralidad, costo de adquisición y utilidad técnica y neta"
}

# 14. RECLAMACIONES: pólizas en vigor y reclamaciones por estado y ramo (CNSF)
explore: reclamaciones_cnsf {
  from: ctx_cnsf_polizas_reclamaciones
  label: "14. Pólizas y Reclamaciones por Estado (CNSF)"
  description: "Pólizas en vigor, reclamaciones recibidas y reclamaciones por cada mil pólizas, por estado y ramo"
}

# ----------------------------------------------------
# 15. EXPLORE: COPILOTO - AVISOS POR CLIENTE
# ----------------------------------------------------
explore: cliente_avisos {
  from: dt_avisos_copiloto
  label: "15. Copiloto: Avisos por Cliente (Demo)"
  description: "Avisos proactivos para la app del cliente: vencimientos próximos, afinidad de producto y clientes desatendidos por su asesor"

  join: cliente_nombre_demo {
    type: left_outer
    sql_on: CAST(${cliente_avisos.id_cliente_num} AS STRING) = CAST(${cliente_nombre_demo.id_cliente_num} AS STRING) ;;
    relationship: many_to_one
  }

  join: asesor_nombre_demo {
    type: left_outer
    sql_on: CAST(${cliente_avisos.id_asesor_cve} AS STRING) = CAST(${asesor_nombre_demo.id_asesor_cve} AS STRING) ;;
    relationship: many_to_one
  }

  join: clientes {
    from: cliente
    type: left_outer
    sql_on: CAST(${cliente_avisos.id_cliente_num} AS STRING) = CAST(${clientes.id_cliente_key} AS STRING) ;;
    relationship: many_to_one
  }

  join: catasesor {
    type: left_outer
    sql_on: ${clientes.id_asesor} = ${catasesor.id_asesor_cve} ;;
    relationship: many_to_one
  }
}
