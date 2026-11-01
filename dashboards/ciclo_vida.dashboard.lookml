---
- dashboard: ciclo_vida
  title: Ciclo de Vida del Cliente — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  description: Monitoreo de cohortes de apertura, estatus de clientes y cuentas, cancelaciones
    y maduración de cartera.
  preferred_slug: sG2xq68LCQ4UNRo4ddQNpk
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Ciclo de Vida del Cliente</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Evolución temporal de altas, maduración de cohortes, estatus de cuentas y retención de pólizas en Actinver.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Ciclo de vida</span>
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
    single_value_title: Clientes con Portafolio
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
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
  - title: Cuentas abiertas
    name: Cuentas abiertas
    model: actinver
    explore: clientes
    type: single_value
    fields: [cuenta.fecha_apertura_month, cuenta.count]
    filters:
      cuenta.fecha_apertura_month: 24 months ago for 24 months
    sorts: [cuenta.fecha_apertura_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: variacion
      label: Variación
      expression: "${cuenta.count} / offset(${cuenta.count}, 1) - 1"
      value_format_name: percent_1
      _kind_hint: measure
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Cuentas abiertas (último mes)
    show_comparison: true
    comparison_type: change
    comparison_label: vs mes anterior
    hidden_fields: [cuenta.fecha_apertura_month]
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
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
  - title: "% Multiproducto"
    name: "% Multiproducto"
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.pct_multiproducto]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Multiproducto (2+ productos)"
    value_format: 0.0%
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
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
  - title: Prima cancelada
    name: Prima cancelada
    model: actinver
    explore: primas
    type: single_value
    fields: [primas.fecha_emision_poliza_month, primas.prima_cancelada]
    filters:
      primas.fecha_emision_poliza_month: 24 months ago for 24 months
    sorts: [primas.fecha_emision_poliza_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: variacion
      label: Variación
      expression: "${primas.prima_cancelada} / offset(${primas.prima_cancelada}, 1)\
        \ - 1"
      value_format_name: percent_1
      _kind_hint: measure
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Prima Cancelada (último mes)
    show_comparison: true
    comparison_type: change
    comparison_label: vs mes anterior
    hidden_fields: [primas.fecha_emision_poliza_month]
    value_format: "$#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    smart_single_value_size: false
    listen:
      lob: producto.lob
    row: 8
    col: 42
    width: 15
    height: 5
    tab_name: ''
  - title: Pólizas canceladas
    name: Pólizas canceladas
    model: actinver
    explore: primas
    type: single_value
    fields: [primas.count_polizas]
    filters:
      primas.tipo_transaccion: CANC%
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Pólizas Canceladas
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    smart_single_value_size: false
    listen:
      lob: producto.lob
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
      \ 12px;'></div>¿Qué tan rápido crecemos en altas? (cuentas por mes y entidad,\
      \ 24 meses)<div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div></div>"
    row: 13
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: "¿Qué tan rápido crecemos en altas? (cuentas por mes y entidad, 24 meses)"
    name: "¿Qué tan rápido crecemos en altas? (cuentas por mes y entidad, 24 meses)"
    model: actinver
    explore: clientes
    type: looker_column
    fields: [cuenta.fecha_apertura_month, cuenta.tipo_entidad_bancaria, cuenta.count]
    pivots: [cuenta.tipo_entidad_bancaria]
    filters:
      cuenta.fecha_apertura_month: 24 months ago for 24 months
    limit: 5000
    column_limit: 50
    stacking: normal
    colors: ["#0f6ff5", "#12998a"]
    show_view_names: false
    show_value_labels: false
    x_axis_label: Mes de Apertura
    y_axis_combined: true
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
    width: 42
    height: 14
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Clientes por estatus (etapa)<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 13
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Clientes por estatus (etapa)
    name: Clientes por estatus (etapa)
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [clientes.id_estatus_cliente, clientes.count]
    limit: 5000
    column_limit: 50
    inner_radius: 55
    colors: ["#0f6ff5", "#12998a", "#3dbe7a", "#e3a33b", "#f0645a"]
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
    col: 42
    width: 30
    height: 14
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Cohortes de apertura y su distribución por escalón<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 29
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: Cohortes de apertura y su distribución por escalón
    name: Cohortes de apertura y su distribución por escalón
    model: actinver
    explore: clientes
    type: looker_column
    fields: [cuenta.fecha_apertura_year, dt_escalera_vinculacion.escalon_vinculacion,
      dt_escalera_vinculacion.count]
    pivots: [dt_escalera_vinculacion.escalon_vinculacion]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      cuenta.fecha_apertura_year: "-NULL"
    sorts: [dt_escalera_vinculacion.escalon_vinculacion, cuenta.fecha_apertura_year
        desc]
    limit: 5000
    column_limit: 50
    stacking: percent
    colors: ["#8573e8", "#e3a33b", "#0f6ff5", "#12998a", "#3dbe7a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: 0.0"%"
    x_axis_label: Año de Apertura
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 31
    col: 0
    width: 42
    height: 14
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Cuentas por estatus de operación<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 29
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Cuentas por estatus de operación
    name: Cuentas por estatus de operación
    model: actinver
    explore: clientes
    type: looker_pie
    fields: [cuenta.id_estatus_cuenta, cuenta.count]
    limit: 5000
    column_limit: 50
    inner_radius: 50
    colors: ["#0f6ff5", "#3dbe7a", "#e3a33b", "#f0645a"]
    show_view_names: false
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 31
    col: 42
    width: 30
    height: 14
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Emisión, renovación y cancelación de pólizas por mes<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 45
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: Emisión, renovación y cancelación de pólizas por mes
    name: Emisión, renovación y cancelación de pólizas por mes
    model: actinver
    explore: primas
    type: looker_column
    fields: [primas.fecha_emision_poliza_month, primas.tipo_transaccion, primas.count_polizas]
    pivots: [primas.tipo_transaccion]
    filters:
      primas.fecha_emision_poliza_month: 24 months ago for 24 months
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5", "#12998a", "#f0645a"]
    show_view_names: false
    show_value_labels: false
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
    row: 47
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Detalle de evolución por cohorte mensual (últimos 24 meses)<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 61
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: Detalle de evolución por cohorte mensual (últimos 24 meses)
    name: Detalle de evolución por cohorte mensual (últimos 24 meses)
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [cuenta.fecha_apertura_month, cuenta.count, dt_escalera_vinculacion.count,
      dt_escalera_vinculacion.clientes_solo_eje, dt_escalera_vinculacion.clientes_multiproducto,
      dt_escalera_vinculacion.pct_multiproducto]
    filters:
      cuenta.fecha_apertura_month: 24 months ago for 24 months
    sorts: [cuenta.fecha_apertura_month desc]
    limit: 5000
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
        fields: [dt_escalera_vinculacion.pct_multiproducto]}]
    series_labels:
      cuenta.fecha_apertura_month: Mes de Apertura
      cuenta.count: Total Cuentas
      dt_escalera_vinculacion.count: Clientes con Tenencia
      dt_escalera_vinculacion.clientes_solo_eje: Clientes Solo Eje
      dt_escalera_vinculacion.clientes_multiproducto: Multiproducto (2+)
      dt_escalera_vinculacion.pct_multiproducto: "% Multiproducto"
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
    row: 63
    col: 0
    width: 72
    height: 16
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
  - name: lob
    title: Línea de negocio
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: primas
    listens_to_filters: []
    field: producto.lob
