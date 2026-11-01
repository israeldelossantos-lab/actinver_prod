---
- dashboard: inteligencia_geogrfica
  title: Inteligencia Geográfica
  preferred_viewer: dashboards-next
  style: modern
  description: Distribución territorial de clientes y pólizas, cobertura por estado
    y centros financieros de Actinver.
  refresh: 1 hour
  preferred_slug: LAgmA1xLt18FzL4i6MXA7O
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Inteligencia Geográfica</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Mapeo de cobertura y clientes utilizando la red territorial de centros financieros y división oficial por entidad federativa.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::vision_360' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Visión 360</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Geografía</span>
          <a href='/dashboards/actinver::calidad_datos' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Calidad de datos</a>
          <a href='/dashboards/actinver::contexto_mercado' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Contexto de mercado</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Entidades con Cobertura
    name: Entidades con Cobertura
    model: actinver
    explore: clientes
    type: single_value
    fields: [catcentrofinanciero.total_estados_cobertura]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Estados Cubiertos
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
  - title: Centros Financieros
    name: Centros Financieros
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
    single_value_title: Clientes Activos
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
    width: 15
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
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 8
    col: 45
    width: 12
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
      \ 12px;'></div>¿Dónde están mis clientes y la cobertura? (Mapa de México)<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 42
    height: 2
    tab_name: ''
  - title: "¿Dónde están mis clientes y la cobertura? (Mapa de México)"
    name: "¿Dónde están mis clientes y la cobertura? (Mapa de México)"
    model: actinver
    explore: clientes
    type: looker_geo_choropleth
    fields: [catcentrofinanciero.estado_nombre, dt_escalera_vinculacion.count]
    filters:
      catcentrofinanciero.estado_nombre: "-Sin ubicación física,-Otra Entidad"
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.count desc]
    limit: 50
    column_limit: 50
    map: topojson
    map_layer_name: actinver::mexico_estados
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors: ["#E8F0FE", "#87B7FA", "#0F6FF5"]
    modern2026: true
    map_url: https://raw.githubusercontent.com/israeldelossantos-lab/actinver_prod/master/maps/mexico_estados.topojson
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
    height: 20
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Top 15 centros financieros por clientes con tenencia<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 42
    width: 30
    height: 2
    tab_name: ''
  - title: Top 15 centros financieros por clientes con tenencia
    name: Top 15 centros financieros por clientes con tenencia
    model: actinver
    explore: clientes
    type: looker_bar
    fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.count]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.count desc]
    limit: 15
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
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 15
    col: 42
    width: 30
    height: 20
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Cómo evoluciona la apertura de clientes en el territorio?<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 35
    col: 0
    width: 30
    height: 2
    tab_name: ''
  - title: "¿Cómo evoluciona la apertura de clientes en el territorio?"
    name: "¿Cómo evoluciona la apertura de clientes en el territorio?"
    model: actinver
    explore: clientes
    type: looker_area
    fields: [cuenta.fecha_apertura_month, dt_escalera_vinculacion.count]
    filters:
      cuenta.fecha_apertura_month: 24 months
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [cuenta.fecha_apertura_month asc]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    modern2026: true
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 37
    col: 0
    width: 30
    height: 16
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Desglose territorial: Estado, Centro, Clientes y Vinculación<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 35
    col: 30
    width: 42
    height: 2
    tab_name: ''
  - title: 'Desglose territorial: Estado, Centro, Clientes y Vinculación'
    name: 'Desglose territorial: Estado, Centro, Clientes y Vinculación'
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [catcentrofinanciero.estado_nombre, catcentrofinanciero.centro_financiero,
      dt_escalera_vinculacion.count, dt_escalera_vinculacion.pct_solo_eje, dt_escalera_vinculacion.productos_promedio,
      clientes.clientes_con_seguro]
    filters:
      dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
    sorts: [dt_escalera_vinculacion.count desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
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
    title_hidden: true
    listen:
      Estado: catcentrofinanciero.estado_nombre
      Centro financiero: catcentrofinanciero.centro_financiero
      Escalón: dt_escalera_vinculacion.escalon_vinculacion
      Entidad: cuenta.tipo_entidad_bancaria
      Tipo de persona: clientes.tipo_persona_desc
    row: 37
    col: 30
    width: 42
    height: 16
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Dónde hay potencial? Peso económico del estado frente a nuestros\
      \ clientes (INEGI y DataMéxico)<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 53
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: "¿Dónde hay potencial? Peso económico del estado frente a nuestros clientes\
      \ (INEGI y DataMéxico)"
    name: "¿Dónde hay potencial? Peso económico del estado frente a nuestros clientes\
      \ (INEGI y DataMéxico)"
    model: actinver
    explore: contexto_estatal
    type: looker_grid
    fields: [contexto_estatal.estado, contexto_estatal.participacion_pib, contexto_estatal.participacion_ied,
      contexto_estatal.ingreso_hogar, ctx_clientes_estado.sucursales, ctx_clientes_estado.clientes,
      ctx_clientes_estado.clientes_por_100k]
    sorts: [contexto_estatal.participacion_pib desc]
    limit: 32
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential2,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [ctx_clientes_estado.clientes_por_100k]}, {type: equal to, value: 0,
        background_color: "#fdecea", font_color: "#b3261e", color_application: !!null '',
        bold: true, italic: false, strikethrough: false, fields: [ctx_clientes_estado.sucursales]}]
    series_labels:
      contexto_estatal.participacion_pib: "% del PIB nacional"
      contexto_estatal.participacion_ied: "% de la inversión extranjera"
      ctx_clientes_estado.clientes_por_100k: Clientes por 100 mil hab.
    series_cell_visualizations:
      contexto_estatal.participacion_pib:
        is_active: true
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    modern2026: true
    title_hidden: true
    row: 55
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
