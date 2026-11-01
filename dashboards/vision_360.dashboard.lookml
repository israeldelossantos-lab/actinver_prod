---
- dashboard: visin_360_del_cliente__portal_actinver
  title: Visión 360 del Cliente — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: Perfil demográfico, segmentación patrimonial AWM, tenencia de seguros
    y cartera por asesor.
  preferred_slug: QeOW1cAqVaDqxBltJkUL24
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Visión 360 del Cliente</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Perfil integral de clientes, distribución de cartera Banco vs Casa de Bolsa, penetración de seguros y tenencia patrimonial AWM.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Visión 360</span>
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
  - title: Total Clientes
    name: Total Clientes
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.count]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Total Clientes
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
    width: 15
    height: 5
    tab_name: ''
  - title: Clientes con portafolio
    name: Clientes con portafolio
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
    single_value_title: Clientes con Portafolio
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
    col: 15
    width: 15
    height: 5
    tab_name: ''
  - title: Clientes AWM Patrimonial
    name: Clientes AWM Patrimonial
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.clientes_patrimoniales_awm]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Clientes Patrimoniales (AWM)
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
    col: 30
    width: 12
    height: 5
    tab_name: ''
  - title: Clientes con seguro
    name: Clientes con seguro
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.clientes_con_seguro]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Clientes con Seguro
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
    col: 42
    width: 15
    height: 5
    tab_name: ''
  - title: "% Con seguro"
    name: "% Con seguro"
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.pct_clientes_con_seguro]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Clientes con Seguro"
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
    col: 57
    width: 15
    height: 5
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Banco vs Casa de Bolsa<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Banco vs Casa de Bolsa
    name: Banco vs Casa de Bolsa
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [cuenta.tipo_entidad_bancaria, clientes.count]
    filters:
      cuenta.tipo_entidad_bancaria: "-NULL"
    limit: 5000
    column_limit: 50
    inner_radius: 50
    colors: ["#0f6ff5", "#12998a"]
    show_view_names: false
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 15
    col: 0
    width: 24
    height: 12
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Tipo de persona (Física vs Moral)<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 24
    width: 24
    height: 2
    tab_name: ''
  - title: Tipo de persona (Física vs Moral)
    name: Tipo de persona (Física vs Moral)
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [clientes.tipo_persona_desc, clientes.count]
    limit: 5000
    column_limit: 50
    inner_radius: 50
    colors: ["#0f6ff5", "#ad883a"]
    show_view_names: false
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 15
    col: 24
    width: 24
    height: 12
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Penetración de seguro en cartera<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: Penetración de seguro en cartera
    name: Penetración de seguro en cartera
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [clientes.cliente_seguro, clientes.count]
    limit: 5000
    column_limit: 50
    inner_radius: 50
    colors: ["#12998a", "#d9d9d9"]
    show_view_names: false
    modern2026: true
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
    height: 12
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Venta cruzada: ¿Tienen seguro los clientes más vinculados?<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 27
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: 'Venta cruzada: ¿Tienen seguro los clientes más vinculados?'
    name: 'Venta cruzada: ¿Tienen seguro los clientes más vinculados?'
    model: actinver
    explore: clientes
    type: looker_column
    fields: [dt_escalera_vinculacion.escalon_vinculacion, clientes.cliente_seguro,
      dt_escalera_vinculacion.count]
    pivots: [clientes.cliente_seguro]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    stacking: normal
    colors: ["#0f6ff5", "#12998a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_label: Escalón
    y_axis_combined: true
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 29
    col: 0
    width: 42
    height: 14
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Altas históricas de clientes por mes<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 27
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Altas históricas de clientes por mes
    name: Altas históricas de clientes por mes
    model: actinver
    explore: clientes
    type: looker_area
    fields: [clientes.fecha_hora_creacion_month, clientes.count]
    filters:
      clientes.fecha_hora_creacion_month: 36 months ago for 36 months
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    x_axis_label: Mes de Alta
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 29
    col: 42
    width: 30
    height: 14
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Clientes por tipo de contrato<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 43
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: Clientes por tipo de contrato
    name: Clientes por tipo de contrato
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [cattipocontrato.tipo_contrato, clientes.count]
    sorts: [clientes.count desc]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 45
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Asesores con más clientes con seguro<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 43
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: Asesores con más clientes con seguro
    name: Asesores con más clientes con seguro
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catasesor.asesor_etiqueta, clientes.clientes_con_seguro]
    sorts: [clientes.clientes_con_seguro desc]
    limit: 15
    column_limit: 50
    colors: ["#12998a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 45
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Ficha 360: Clientes y vinculación<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 59
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: 'Ficha 360: Clientes y vinculación'
    name: 'Ficha 360: Clientes y vinculación'
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [clientes.foto, clientes.id_cliente_num, clientes.tipo_persona_desc, dt_escalera_vinculacion.escalon_vinculacion,
      dt_escalera_vinculacion.total_productos_validos, clientes.segmento_awm, clientes.cliente_seguro,
      catcentrofinanciero.centro_financiero, catasesor.asesor_etiqueta]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.total_productos_validos desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: custom, custom: {
            id: actinver-azul, label: Actinver azul, type: continuous, stops: [{color: "#e8f0fe",
                offset: 0}, {color: "#87b7fa", offset: 50}, {color: "#0f6ff5", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [dt_escalera_vinculacion.total_productos_validos]}]
    series_labels:
      clientes.foto: Foto
      clientes.id_cliente_num: Cliente
      clientes.tipo_persona_desc: Persona
      dt_escalera_vinculacion.escalon_vinculacion: Escalón
      dt_escalera_vinculacion.total_productos_validos: Productos
      clientes.segmento_awm: AWM
      clientes.cliente_seguro: Seguro
      catcentrofinanciero.centro_financiero: Centro
      catasesor.asesor_etiqueta: Asesor
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 61
    col: 0
    width: 72
    height: 18
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
