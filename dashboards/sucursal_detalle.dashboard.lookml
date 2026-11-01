---
- dashboard: detalle_de_sucursal_clientes_y_oportunidad
  title: 'Detalle de Sucursal: Clientes y Oportunidad'
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: 'Drill de clientes por centro financiero: escalón de vinculación, tenencia
    de productos, seguros y productos sugeridos.'
  refresh: 1 hour
  preferred_slug: NkpbmatXMlmDdh23YsjZyd
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Detalle de Sucursal: Clientes y Oportunidad</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Perfil detallado del centro financiero, clientes asignados, distribución por escalón y catálogo de siguiente mejor producto.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #FFFFFF; font-weight: 700; text-decoration: none; padding: 5px 12px; border-radius: 999px; background: rgba(15,111,245,0.22); border: 1px solid #0F6FF5; white-space: nowrap;'>← Volver a Sucursales</a>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
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
  - title: Clientes con Tenencia
    name: Clientes con Tenencia
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
    single_value_title: Total Clientes
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 8
    col: 0
    width: 18
    height: 5
    tab_name: ''
  - title: "% Solo Eje"
    name: "% Solo Eje"
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.pct_solo_eje]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: "% Oportunidad Solo Eje"
    value_format: 0.0%
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 8
    col: 18
    width: 18
    height: 5
    tab_name: ''
  - title: Productos Promedio
    name: Productos Promedio
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.productos_promedio]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Productos / Cliente
    value_format: '0.00'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 8
    col: 36
    width: 18
    height: 5
    tab_name: ''
  - title: "% con Seguro"
    name: "% con Seguro"
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: pct_seguro
      label: "% con Seguro"
      expression: "${clientes.clientes_con_seguro} / ${dt_escalera_vinculacion.count}"
      value_format_name: percent_1
    hidden_fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Penetración de Seguros
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 8
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
      \ 12px;'></div>Distribución de clientes por escalón de vinculación en la sucursal<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: Distribución de clientes por escalón de vinculación en la sucursal
    name: Distribución de clientes por escalón de vinculación en la sucursal
    model: actinver
    explore: clientes
    type: looker_column
    fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.escalon_vinculacion asc]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    modern2026: true
    title_hidden: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 15
    col: 0
    width: 42
    height: 12
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Clientes de la sucursal: portafolio y siguiente mejor producto<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 27
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: 'Clientes de la sucursal: portafolio y siguiente mejor producto'
    name: 'Clientes de la sucursal: portafolio y siguiente mejor producto'
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [clientes.foto, clientes.id_cliente_num, clientes.tipo_persona_desc, dt_escalera_vinculacion.escalon_vinculacion,
      dt_escalera_vinculacion.total_productos_validos, clientes.cliente_seguro, clientes.segmento_awm,
      clientes.fecha_hora_creacion_date, dt_siguiente_producto_sugerido.siguiente_producto_sugerido]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.total_productos_validos desc]
    limit: 200
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
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 29
    col: 0
    width: 72
    height: 24
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Productos sugeridos para los clientes de la sucursal<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Productos sugeridos para los clientes de la sucursal
    name: Productos sugeridos para los clientes de la sucursal
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [dt_siguiente_producto_sugerido.siguiente_producto_sugerido, dt_siguiente_producto_sugerido.count]
    filters:
      dt_siguiente_producto_sugerido.siguiente_producto_sugerido: "-NULL"
    sorts: [dt_siguiente_producto_sugerido.count desc]
    limit: 8
    column_limit: 50
    colors: ["#12998a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    x_axis_label: ''
    modern2026: true
    title_hidden: true
    listen:
      Centro financiero: catcentrofinanciero.centro_financiero
    row: 15
    col: 42
    width: 30
    height: 12
    tab_name: ''
  filters:
  - name: Centro financiero
    title: Centro financiero
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: catcentrofinanciero.centro_financiero
