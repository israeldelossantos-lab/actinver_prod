---
- dashboard: desempeno_sucursales
  title: Desempeño de Sucursales — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: Monitoreo territorial, ranking de centros financieros, concentración
    de cartera y oportunidad de vinculación por asesor.
  preferred_slug: OH2ZF2D3IbkwXgwaAwauoa
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Desempeño de Sucursales y Centros Financieros</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Monitoreo territorial, ranking de centros financieros, concentración de cartera y oportunidad de vinculación por asesor.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Sucursales</span>
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
    height: 7
    tab_name: ''
  - title: Centros financieros
    name: Centros financieros
    model: actinver
    explore: clientes
    type: single_value
    fields: [catcentrofinanciero.count]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Total Centros
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
    row: 7
    col: 0
    width: 18
    height: 5
    tab_name: ''
  - title: Asesores activos
    name: Asesores activos
    model: actinver
    explore: clientes
    type: single_value
    fields: [catasesor.asesores_activos]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Asesores Activos
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
    row: 7
    col: 18
    width: 18
    height: 5
    tab_name: ''
  - title: Clientes por centro
    name: Clientes por centro
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.count, catcentrofinanciero.count]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: clientes_por_centro
      label: Clientes por Centro
      expression: if(${catcentrofinanciero.count} > 0, ${dt_escalera_vinculacion.count}
        / ${catcentrofinanciero.count}, null)
      value_format: "#,##0"
      _kind_hint: measure
    hidden_fields: [dt_escalera_vinculacion.count, catcentrofinanciero.count]
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Clientes por Centro Promedio
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
    row: 7
    col: 36
    width: 18
    height: 5
    tab_name: ''
  - title: "% Solo eje"
    name: "% Solo eje"
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.pct_solo_eje]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Solo eje (Oportunidad)"
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
    row: 7
    col: 54
    width: 18
    height: 5
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Mapa de sucursales: clientes y % solo eje<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 12
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: 'Mapa de sucursales: clientes y % solo eje'
    name: 'Mapa de sucursales: clientes y % solo eje'
    model: actinver
    explore: clientes
    type: looker_google_map
    fields: [catcentrofinanciero.centro_financiero, dt_centro_ubicacion.ubicacion,
      dt_escalera_vinculacion.count, dt_escalera_vinculacion.pct_solo_eje]
    filters:
      dt_centro_ubicacion.ubicacion: "-NULL"
    sorts: [dt_escalera_vinculacion.count desc 0]
    limit: 5000
    column_limit: 50
    map_plot_mode: heatmap
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: false
    map_pannable: true
    map_zoomable: true
    map_point_color: "#0f6ff5"
    map_marker_radius_min: 5
    map_marker_radius_max: 20
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 14
    col: 0
    width: 42
    height: 16
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Ranking de centros por clientes con tenencia<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 12
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Ranking de centros por clientes con tenencia
    name: Ranking de centros por clientes con tenencia
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.count]
    sorts: [dt_escalera_vinculacion.count desc]
    limit: 15
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_end: max, range_start: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#f0645a", label: Promedio red}]
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 14
    col: 42
    width: 30
    height: 16
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Qué centros tienen más oportunidad de vinculación?<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 30
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: "¿Qué centros tienen más oportunidad de vinculación?"
    name: "¿Qué centros tienen más oportunidad de vinculación?"
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [catcentrofinanciero.centro_financiero, catcentrofinanciero.estado_nombre,
      dt_escalera_vinculacion.count, dt_escalera_vinculacion.clientes_solo_eje, dt_escalera_vinculacion.pct_solo_eje,
      dt_escalera_vinculacion.productos_promedio]
    sorts: [dt_escalera_vinculacion.pct_solo_eje desc]
    limit: 50
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
        fields: [dt_escalera_vinculacion.pct_solo_eje]}]
    series_labels:
      catcentrofinanciero.centro_financiero: Centro Financiero
      catcentrofinanciero.estado_nombre: Estado
      dt_escalera_vinculacion.count: Total Clientes
      dt_escalera_vinculacion.clientes_solo_eje: Clientes Solo Eje
      dt_escalera_vinculacion.pct_solo_eje: "% Solo Eje"
      dt_escalera_vinculacion.productos_promedio: Productos Promedio
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
    row: 32
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿La apertura de cuentas crece y cambia la vinculación?<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 48
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: "¿La apertura de cuentas crece y cambia la vinculación?"
    name: "¿La apertura de cuentas crece y cambia la vinculación?"
    model: actinver
    explore: clientes
    type: looker_column
    fields: [cuenta.fecha_apertura_month, dt_escalera_vinculacion.escalon_vinculacion,
      dt_escalera_vinculacion.count]
    pivots: [dt_escalera_vinculacion.escalon_vinculacion]
    filters:
      cuenta.fecha_apertura_month: 24 months ago for 24 months
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    limit: 5000
    column_limit: 50
    stacking: normal
    colors: ["#8573e8", "#e3a33b", "#0f6ff5", "#12998a", "#3dbe7a"]
    show_view_names: false
    show_value_labels: false
    x_axis_label: Mes de Apertura
    y_axis_combined: true
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 50
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
      \ 12px;'></div>¿Cuántos clientes sin vincular tiene cada asesor?<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 48
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: "¿Cuántos clientes sin vincular tiene cada asesor?"
    name: "¿Cuántos clientes sin vincular tiene cada asesor?"
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catasesor.asesor_etiqueta, dt_escalera_vinculacion.clientes_solo_eje]
    sorts: [dt_escalera_vinculacion.clientes_solo_eje desc]
    limit: 15
    column_limit: 50
    colors: ["#e3a33b"]
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
    row: 50
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
      \ 12px;'></div>Clientes por estado<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 64
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: Clientes por estado
    name: Clientes por estado
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catcentrofinanciero.estado_nombre, dt_escalera_vinculacion.count]
    sorts: [dt_escalera_vinculacion.count desc]
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
    row: 66
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
