---
- dashboard: vinculacion_cliente
  title: Vinculación — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: Monitoreo de la escalera de tenencia, venta cruzada y afinidad de productos
    de inversión en Actinver.
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'>
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Vinculación del Cliente</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Análisis de tenencia y diversificación de productos válidos de inversión, escalera de vinculación y afinidad de portafolios en Actinver.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Vinculación</span>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::vision_360' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Visión 360</a>
          <a href='/dashboards/actinver::geografia' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Geografía</a>
          <a href='/dashboards/actinver::calidad_datos' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Calidad de datos</a>
          <a href='/dashboards/actinver::contexto_mercado' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Contexto de mercado</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Clientes con tenencia
    name: Clientes con tenencia
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.count]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Clientes con tenencia
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 8
    col: 0
    width: 18
    height: 5
    tab_name: ''
  - title: "% Solo eje"
    name: "% Solo eje"
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.pct_solo_eje]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Solo eje (por activar)"
    value_format: 0.0%
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 8
    col: 18
    width: 18
    height: 5
    tab_name: ''
  - title: Productos promedio
    name: Productos promedio
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.productos_promedio]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Productos promedio por cliente
    value_format: '0.00'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 8
    col: 36
    width: 18
    height: 5
    tab_name: ''
  - title: Cuentas abiertas
    name: Cuentas abiertas
    model: actinver
    explore: clientes
    type: single_value
    fields: [cuenta.fecha_apertura_month, cuenta.count]
    filters:
      cuenta.fecha_apertura_month: 24 months ago for 24 months
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [cuenta.fecha_apertura_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: variacion
      label: Variación
      expression: "${cuenta.count} / offset(${cuenta.count}, 1) - 1"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [cuenta.fecha_apertura_month]
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Cuentas abiertas (último mes)
    show_comparison: true
    comparison_type: change
    comparison_label: vs mes anterior
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 8
    col: 54
    width: 18
    height: 5
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Dónde se atora la vinculación? (clientes por escalón)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 48
    height: 2
    tab_name: ''
  - title: "¿Dónde se atora la vinculación? (clientes por escalón)"
    name: "¿Dónde se atora la vinculación? (clientes por escalón)"
    model: actinver
    explore: clientes
    type: looker_column
    fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_label: Escalón
    y_axis_gridlines: true
    hide_legend: true
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 15
    col: 0
    width: 48
    height: 14
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>% Multiproducto (2 o más productos)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: "% Multiproducto (2 o más productos)"
    name: "% Multiproducto (2 o más productos)"
    model: actinver
    explore: clientes
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [dt_escalera_vinculacion.pct_multiproducto]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    fill_color: "#0f6ff5"
    background_color: "#d9d9d9"
    range_min: 0
    range_max: 1
    value_formatting: 0.0%
    range_formatting: 0%
    value_label_type: value
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 15
    col: 48
    width: 24
    height: 14
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Qué productos tienen nuestros clientes? (% de clientes con tenencia)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 29
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: "¿Qué productos tienen nuestros clientes? (% de clientes con tenencia)"
    name: "¿Qué productos tienen nuestros clientes? (% de clientes con tenencia)"
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [cliente_producto_09_10_2026.count, cliente_producto_09_10_2026.penetracion_fondos_deuda,
      cliente_producto_09_10_2026.penetracion_reporto, cliente_producto_09_10_2026.penetracion_renta_variable,
      cliente_producto_09_10_2026.penetracion_prlv]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: fondos_de_deuda
      label: Fondos de deuda
      expression: "${cliente_producto_09_10_2026.penetracion_fondos_deuda} / ${cliente_producto_09_10_2026.count}"
      value_format_name: percent_1
      _kind_hint: measure
    - table_calculation: mercado_de_dinero_reporto
      label: Mercado de dinero reporto
      expression: "${cliente_producto_09_10_2026.penetracion_reporto} / ${cliente_producto_09_10_2026.count}"
      value_format_name: percent_1
      _kind_hint: measure
    - table_calculation: renta_variable
      label: Renta variable
      expression: "${cliente_producto_09_10_2026.penetracion_renta_variable} / ${cliente_producto_09_10_2026.count}"
      value_format_name: percent_1
      _kind_hint: measure
    - table_calculation: prlv
      label: PRLV
      expression: "${cliente_producto_09_10_2026.penetracion_prlv} / ${cliente_producto_09_10_2026.count}"
      value_format_name: percent_1
      _kind_hint: measure
    hidden_fields: [cliente_producto_09_10_2026.count, cliente_producto_09_10_2026.penetracion_fondos_deuda,
      cliente_producto_09_10_2026.penetracion_reporto, cliente_producto_09_10_2026.penetracion_renta_variable,
      cliente_producto_09_10_2026.penetracion_prlv]
    colors: ["#0f6ff5", "#12998a", "#ad883a", "#8573e8"]
    show_view_names: false
    show_value_labels: true
    label_value_format: 0.0%
    legend_position: center
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 31
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Con qué entidad dan el primer paso? (clientes Eje + 1)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 29
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: "¿Con qué entidad dan el primer paso? (clientes Eje + 1)"
    name: "¿Con qué entidad dan el primer paso? (clientes Eje + 1)"
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [cuenta.tipo_entidad_bancaria, dt_escalera_vinculacion.count]
    filters:
      cuenta.tipo_entidad_bancaria: "-NULL"
      dt_escalera_vinculacion.escalon_vinculacion: Eje + 1
    limit: 5000
    column_limit: 50
    inner_radius: 55
    colors: ["#0f6ff5", "#12998a", "#ad883a"]
    value_labels: labels
    label_type: labPer
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 31
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>Centros con más clientes solo eje (oportunidad)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 45
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: Centros con más clientes solo eje (oportunidad)
    name: Centros con más clientes solo eje (oportunidad)
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.pct_solo_eje]
    filters:
      catcentrofinanciero.centro_financiero: "-NULL"
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.pct_solo_eje desc]
    limit: 15
    column_limit: 50
    colors: ["#e3a33b"]
    show_view_names: false
    show_value_labels: true
    label_value_format: 0.0%
    hide_legend: true
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 47
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Qué productos van juntos? (afinidad, top 20 por lift)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 45
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: "¿Qué productos van juntos? (afinidad, top 20 por lift)"
    name: "¿Qué productos van juntos? (afinidad, top 20 por lift)"
    model: actinver
    explore: afinidad_productos
    type: looker_grid
    fields: [afinidad_productos.producto_origen, afinidad_productos.producto_destino,
      afinidad_productos.clientes_con_ambos, afinidad_productos.lift_promedio]
    sorts: [afinidad_productos.lift_promedio desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: modern
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: null, background_color: null,
        font_color: null, color_application: {collection_id: custom, custom: {id: actinver-azul,
            label: Actinver azul, type: continuous, stops: [{color: "#e8f0fe", offset: 0},
              {color: "#87b7fa", offset: 50}, {color: "#0f6ff5", offset: 100}]}, options: {
            steps: 5}}, bold: false, italic: false, strikethrough: false, fields: [afinidad_productos.lift_promedio]}]
    series_labels:
      afinidad_productos.producto_origen: Tiene
      afinidad_productos.producto_destino: Le ofrecemos
      afinidad_productos.clientes_con_ambos: Clientes con ambos
      afinidad_productos.lift_promedio: Lift
    modern2026: true
    table_show_footer: true
    title_hidden: true
    row: 47
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Qué le ofrezco a cada cliente y por qué?<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 63
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: "¿Qué le ofrezco a cada cliente y por qué?"
    name: "¿Qué le ofrezco a cada cliente y por qué?"
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [clientes.id_cliente_num, dt_escalera_vinculacion.escalon_vinculacion, dt_siguiente_producto_sugerido.siguiente_producto_sugerido,
      dt_siguiente_producto_sugerido.pct_grupo_que_lo_tiene, dt_siguiente_producto_sugerido.lift_estimado,
      dt_siguiente_producto_sugerido.razon_recomendacion, catcentrofinanciero.centro_financiero]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_siguiente_producto_sugerido.lift_estimado desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: modern
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: null, background_color: null,
        font_color: null, color_application: {collection_id: custom, custom: {id: actinver-azul,
            label: Actinver azul, type: continuous, stops: [{color: "#e8f0fe", offset: 0},
              {color: "#87b7fa", offset: 50}, {color: "#0f6ff5", offset: 100}]}, options: {
            steps: 5}}, bold: false, italic: false, strikethrough: false, fields: [dt_siguiente_producto_sugerido.lift_estimado]}]
    series_labels:
      clientes.id_cliente_num: Cliente
      dt_escalera_vinculacion.escalon_vinculacion: Escalón
      dt_siguiente_producto_sugerido.siguiente_producto_sugerido: Producto sugerido
      dt_siguiente_producto_sugerido.pct_grupo_que_lo_tiene: "% de su grupo que lo tiene"
      dt_siguiente_producto_sugerido.lift_estimado: Lift
      dt_siguiente_producto_sugerido.razon_recomendacion: "¿Por qué?"
      catcentrofinanciero.centro_financiero: Centro
    modern2026: true
    table_show_footer: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 65
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Qué producto conviene ofrecer primero? (clientes por siguiente producto sugerido)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 83
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: "¿Qué producto conviene ofrecer primero? (clientes por siguiente producto sugerido)"
    name: "¿Qué producto conviene ofrecer primero? (clientes por siguiente producto sugerido)"
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [dt_siguiente_producto_sugerido.siguiente_producto_sugerido, dt_siguiente_producto_sugerido.count]
    filters:
      dt_siguiente_producto_sugerido.siguiente_producto_sugerido: "-NULL"
    sorts: [dt_siguiente_producto_sugerido.count desc]
    limit: 12
    column_limit: 50
    colors: ["#12998a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_label: ''
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 85
    col: 0
    width: 72
    height: 14
    tab_name: ''
  filters:
  - name: Estado
    title: Estado
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: catcentrofinanciero.estado_nombre
  - name: Centro financiero
    title: Centro financiero
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: clientes
    listens_to_filters: [Estado]
    field: catcentrofinanciero.centro_financiero
  - name: Escalón
    title: Escalón
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: dt_escalera_vinculacion.escalon_vinculacion
  - name: Entidad
    title: Entidad
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: cuenta.tipo_entidad_bancaria
  - name: Tipo de persona
    title: Tipo de persona
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: clientes.tipo_persona_desc
