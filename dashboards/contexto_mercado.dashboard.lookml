---
- dashboard: contexto_mercado
  title: Contexto de mercado — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  description: Tasas, inflación, tipo de cambio y Bolsa (Banxico), México frente al
    mundo (Banco Mundial), potencial por estado (INEGI y DataMéxico) y red de sucursales
    oficiales.
  refresh: 12 hours
  preferred_slug: CJCf78dB3UHoYs373JEqwd
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Contexto de mercado</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>El entorno en el que compiten nuestros productos: tasas y CETES, inflación, dólar y Bolsa, cómo se compara México con la región y en qué estados hay potencial sin atender. Fuentes públicas: Banco de México, Banco Mundial, INEGI y DataMéxico.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::vision_360' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Visión 360</a>
          <a href='/dashboards/actinver::geografia' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Geografía</a>
          <a href='/dashboards/actinver::calidad_datos' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Calidad de datos</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Contexto de mercado</span>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Tasa objetivo Banxico
    name: Tasa objetivo Banxico
    model: actinver
    explore: mercado_mexico
    type: single_value
    fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
    filters:
      ctx_mercado_ultimo.serie_id: SF61745
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Tasa objetivo Banxico
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: pb en 12 meses
    value_format: 0.00"%"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
    enable_conditional_formatting: true
    row: 8
    col: 0
    width: 18
    height: 5
    tab_name: ''
  - title: CETES 28 días
    name: CETES 28 días
    model: actinver
    explore: mercado_mexico
    type: single_value
    fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
    filters:
      ctx_mercado_ultimo.serie_id: SF60633
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: CETES 28 días
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: pb en 12 meses
    value_format: 0.00"%"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
    enable_conditional_formatting: true
    row: 8
    col: 18
    width: 18
    height: 5
    tab_name: ''
  - title: Inflación anual
    name: Inflación anual
    model: actinver
    explore: mercado_mexico
    type: single_value
    fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
    filters:
      ctx_mercado_ultimo.serie_id: SP30578
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Inflación anual
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: pb en 12 meses
    value_format: 0.00"%"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
    enable_conditional_formatting: true
    row: 8
    col: 36
    width: 18
    height: 5
    tab_name: ''
  - title: Dólar FIX
    name: Dólar FIX
    model: actinver
    explore: mercado_mexico
    type: single_value
    fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
    filters:
      ctx_mercado_ultimo.serie_id: SF43718
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Dólar FIX
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% en 12 meses"
    value_format: "$0.00"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    smart_single_value_size: false
    enable_conditional_formatting: true
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
      \ 12px;'></div>¿Le gana la tasa a la inflación? Tasa objetivo, CETES 28 e inflació\
      n anual<div style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 48
    height: 2
    tab_name: ''
  - title: "¿Le gana la tasa a la inflación? Tasa objetivo, CETES 28 e inflación anual"
    name: "¿Le gana la tasa a la inflación? Tasa objetivo, CETES 28 e inflación anual"
    model: actinver
    explore: mercado_mexico
    type: looker_line
    fields: [mercado_mexico.fecha_month, mercado_mexico.indicador, mercado_mexico.valor]
    pivots: [mercado_mexico.indicador]
    filters:
      mercado_mexico.serie_id: SF61745,SF60633,SP30578
    sorts: [mercado_mexico.fecha_month]
    limit: 500
    column_limit: 50
    colors: ["#0f6ff5", "#12998a", "#d9704c"]
    show_view_names: false
    show_value_labels: false
    interpolation: linear
    point_style: none
    x_axis_label: ''
    y_axis_value_format: 0.0"%"
    legend_position: center
    modern2026: true
    title_hidden: true
    listen:
      Periodo: mercado_mexico.fecha_month
    row: 15
    col: 0
    width: 48
    height: 16
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Dólar FIX (promedio mensual)<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 13
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: Dólar FIX (promedio mensual)
    name: Dólar FIX (promedio mensual)
    model: actinver
    explore: mercado_mexico
    type: looker_area
    fields: [mercado_mexico.fecha_month, mercado_mexico.valor]
    filters:
      mercado_mexico.serie_id: SF43718
    sorts: [mercado_mexico.fecha_month]
    limit: 500
    column_limit: 50
    colors: ["#ad883a"]
    show_view_names: false
    interpolation: linear
    point_style: none
    x_axis_label: ''
    y_axis_value_format: "$0.00"
    y_axis_zero: false
    modern2026: true
    title_hidden: true
    listen:
      Periodo: mercado_mexico.fecha_month
    row: 15
    col: 48
    width: 24
    height: 16
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>La Bolsa: S&amp;P/BMV IPC al cierre de cada mes<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 31
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: 'La Bolsa: S&P/BMV IPC al cierre de cada mes'
    name: 'La Bolsa: S&P/BMV IPC al cierre de cada mes'
    model: actinver
    explore: mercado_mexico
    type: looker_area
    fields: [mercado_mexico.fecha_month, mercado_mexico.valor]
    filters:
      mercado_mexico.serie_id: SF4782
    sorts: [mercado_mexico.fecha_month]
    limit: 500
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    interpolation: linear
    point_style: none
    x_axis_label: ''
    y_axis_value_format: "#,##0"
    y_axis_zero: false
    modern2026: true
    title_hidden: true
    listen:
      Periodo: mercado_mexico.fecha_month
    row: 33
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Índices sectoriales de la Bolsa: cambio % en 12 meses<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 31
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: 'Índices sectoriales de la Bolsa: cambio % en 12 meses'
    name: 'Índices sectoriales de la Bolsa: cambio % en 12 meses'
    model: actinver
    explore: mercado_mexico
    type: looker_bar
    fields: [ctx_mercado_ultimo.indicador, ctx_mercado_ultimo.cambio_12_meses]
    filters:
      ctx_mercado_ultimo.serie_id: SF364756,SF364757,SF364758,SF364759,SF364760,SF364761
    sorts: [ctx_mercado_ultimo.cambio_12_meses desc]
    limit: 10
    column_limit: 50
    colors: ["#12998a"]
    show_view_names: false
    show_value_labels: true
    x_axis_label: ''
    modern2026: true
    title_hidden: true
    row: 33
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Inclusión financiera: adultos con cuenta (%), último año disponible<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 47
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: 'Inclusión financiera: adultos con cuenta (%), último año disponible'
    name: 'Inclusión financiera: adultos con cuenta (%), último año disponible'
    model: actinver
    explore: mexico_mundo
    type: looker_bar
    fields: [mexico_mundo.pais, mexico_mundo.valor]
    filters:
      mexico_mundo.serie_id: FX.OWN.TOTL.ZS
      mexico_mundo.es_ultimo_anio: 'Yes'
    sorts: [mexico_mundo.valor desc]
    limit: 10
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: '0.0'
    x_axis_label: ''
    modern2026: true
    title_hidden: true
    row: 49
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Crecimiento del PIB (%): México, América Latina y el mundo<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 47
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: 'Crecimiento del PIB (%): México, América Latina y el mundo'
    name: 'Crecimiento del PIB (%): México, América Latina y el mundo'
    model: actinver
    explore: mexico_mundo
    type: looker_line
    fields: [mexico_mundo.anio, mexico_mundo.pais, mexico_mundo.valor]
    pivots: [mexico_mundo.pais]
    filters:
      mexico_mundo.serie_id: NY.GDP.MKTP.KD.ZG
      mexico_mundo.pais: México,América Latina y el Caribe,Mundo
    sorts: [mexico_mundo.anio]
    limit: 500
    column_limit: 50
    colors: ["#0f6ff5", "#ad883a", "#8a94a3"]
    show_view_names: false
    interpolation: linear
    x_axis_label: ''
    y_axis_value_format: '0.0'
    legend_position: center
    modern2026: true
    title_hidden: true
    row: 49
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Red de sucursales oficiales (48) con su región comercial<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 63
    col: 0
    width: 30
    height: 2
    tab_name: ''
  - title: Red de sucursales oficiales (48) con su región comercial
    name: Red de sucursales oficiales (48) con su región comercial
    model: actinver
    explore: sucursales_oficiales
    type: looker_google_map
    fields: [sucursales_oficiales.ubicacion, sucursales_oficiales.nombre_oficial,
      sucursales_oficiales.region_oficial, sucursales_oficiales.count]
    limit: 100
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    map_tile_provider: light
    map_position: custom
    map_latitude: 23.6
    map_longitude: -102.5
    map_zoom: 5
    map_marker_type: circle
    map_marker_radius_mode: fixed
    map_marker_radius_fixed: 7
    map_marker_color: ["#0f6ff5"]
    show_legend: false
    title_hidden: true
    row: 65
    col: 0
    width: 30
    height: 18
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Estados con peso económico y sin sucursal: dónde crecer<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 63
    col: 30
    width: 42
    height: 2
    tab_name: ''
  - title: 'Estados con peso económico y sin sucursal: dónde crecer'
    name: 'Estados con peso económico y sin sucursal: dónde crecer'
    model: actinver
    explore: contexto_estatal
    type: looker_grid
    fields: [contexto_estatal.estado, contexto_estatal.participacion_pib, contexto_estatal.participacion_ied,
      contexto_estatal.poblacion, ctx_clientes_estado.clientes]
    filters:
      ctx_clientes_estado.tiene_sucursal: 'No'
    sorts: [contexto_estatal.participacion_pib desc]
    limit: 15
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_labels:
      contexto_estatal.participacion_pib: "% del PIB nacional"
      contexto_estatal.participacion_ied: "% de la inversión extranjera"
    series_cell_visualizations:
      contexto_estatal.participacion_pib:
        is_active: true
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    modern2026: true
    title_hidden: true
    row: 65
    col: 30
    width: 42
    height: 18
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    body_text: "<p style='font-size: 12px; color: #5B6678; margin: 0;'>Fuentes: Banco\
      \ de México (SIE), Banco Mundial (WDI y Global Findex), INEGI y DataMéxico;\
      \ se actualizan con la ingesta de <code>ingesta_contexto/</code>. Clientes y\
      \ sucursales: datos internos sintéticos de demostración.</p>"
    row: 83
    col: 0
    width: 72
    height: 2
    tab_name: ''
  filters:
  - name: Periodo
    title: Periodo
    type: field_filter
    default_value: 60 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: actinver
    explore: mercado_mexico
    listens_to_filters: []
    field: mercado_mexico.fecha_month
