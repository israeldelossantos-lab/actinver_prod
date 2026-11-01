---
- dashboard: calidad_datos
  title: 'Transversal: Calidad de Datos y Gobierno'
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: Monitoreo de integridad de datos, reglas de consistencia técnica, completitud
    y gobierno de datos en Actinver.
  refresh: 1 hour
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Transversal (Calidad de Datos y Gobierno)</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Matriz de reglas de integridad referencial, consistencia técnica y gobierno de datos en Actinver.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::vision_360' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Visión 360</a>
          <a href='/dashboards/actinver::geografia' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Geografía</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Calidad de datos</span>
          <a href='/dashboards/actinver::contexto_mercado' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Contexto de mercado</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Reglas Evaluadas
    name: Reglas Evaluadas
    model: actinver
    explore: calidad_datos
    type: single_value
    fields: [calidad_datos.total_reglas]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Total Reglas
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 8
    col: 0
    width: 15
    height: 5
    tab_name: ''
  - title: Reglas con Observación
    name: Reglas con Observación
    model: actinver
    explore: calidad_datos
    type: single_value
    fields: [calidad_datos.reglas_con_falla]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Con Observación
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 8
    col: 15
    width: 15
    height: 5
    tab_name: ''
  - title: Reglas Conformes
    name: Reglas Conformes
    model: actinver
    explore: calidad_datos
    type: single_value
    fields: [calidad_datos.reglas_sin_falla]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: 100% Conformes
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 8
    col: 30
    width: 12
    height: 5
    tab_name: ''
  - title: "% Promedio de Falla"
    name: "% Promedio de Falla"
    model: actinver
    explore: calidad_datos
    type: single_value
    fields: [calidad_datos.pct_promedio_falla]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Falla Promedio"
    value_format: 0.00%
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 8
    col: 42
    width: 15
    height: 5
    tab_name: ''
  - title: Total Registros con Falla
    name: Total Registros con Falla
    model: actinver
    explore: calidad_datos
    type: single_value
    fields: [calidad_datos.total_registros_con_falla]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Registros Observados
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 8
    col: 57
    width: 15
    height: 5
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>Matriz de Reglas de Calidad e Integridad de Datos (R1 a R9)<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: Matriz de Reglas de Calidad e Integridad de Datos (R1 a R9)
    name: Matriz de Reglas de Calidad e Integridad de Datos (R1 a R9)
    model: actinver
    explore: calidad_datos
    type: looker_grid
    fields: [calidad_datos.regla, calidad_datos.descripcion, calidad_datos.tabla, calidad_datos.severidad,
      calidad_datos.registros_evaluados, calidad_datos.registros_con_falla, calidad_datos.pct_falla,
      calidad_datos.accion]
    sorts: [calidad_datos.regla asc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: modern
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    color_application:
      collection_id: custom
      custom:
        id: actinver-azul
        label: Actinver azul
        type: continuous
        stops:
        - color: "#e8f0fe"
          offset: 0
        - color: "#87b7fa"
          offset: 50
        - color: "#0f6ff5"
          offset: 100
      options:
        steps: 5
    modern2026: true
    table_show_footer: true
    title_hidden: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 15
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>¿Qué reglas acumulan mayor volumen de registros con observación?<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 33
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: "¿Qué reglas acumulan mayor volumen de registros con observación?"
    name: "¿Qué reglas acumulan mayor volumen de registros con observación?"
    model: actinver
    explore: calidad_datos
    type: looker_column
    fields: [calidad_datos.regla, calidad_datos.total_registros_con_falla]
    sorts: [calidad_datos.total_registros_con_falla desc]
    limit: 5000
    column_limit: 50
    colors: ["#f0645a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    modern2026: true
    title_hidden: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 35
    col: 0
    width: 24
    height: 16
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>Distribución de reglas por nivel de severidad<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 33
    col: 24
    width: 24
    height: 2
    tab_name: ''
  - title: Distribución de reglas por nivel de severidad
    name: Distribución de reglas por nivel de severidad
    model: actinver
    explore: calidad_datos
    type: looker_pie
    fields: [calidad_datos.severidad, calidad_datos.total_reglas]
    sorts: [calidad_datos.total_reglas desc]
    limit: 5000
    column_limit: 50
    colors: ["#f0645a", "#e3a33b", "#3dbe7a", "#0f6ff5"]
    show_view_names: false
    inner_radius: 50
    modern2026: true
    title_hidden: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 35
    col: 24
    width: 24
    height: 16
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div>% de falla promedio por tabla fuente<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 33
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: "% de falla promedio por tabla fuente"
    name: "% de falla promedio por tabla fuente"
    model: actinver
    explore: calidad_datos
    type: looker_bar
    fields: [calidad_datos.tabla, calidad_datos.pct_promedio_falla]
    sorts: [calidad_datos.pct_promedio_falla desc]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: 0.00%
    x_axis_gridlines: false
    y_axis_gridlines: true
    modern2026: true
    title_hidden: true
    listen:
      Severidad: calidad_datos.severidad
      Tabla: calidad_datos.tabla
    row: 35
    col: 48
    width: 24
    height: 16
    tab_name: ''
  filters:
  - name: Severidad
    title: Severidad
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: calidad_datos
    listens_to_filters: []
    field: calidad_datos.severidad
  - name: Tabla
    title: Tabla
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: calidad_datos
    listens_to_filters: []
    field: calidad_datos.tabla
