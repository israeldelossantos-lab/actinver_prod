- dashboard: contexto_mercado
  title: Contexto de mercado — Portal Actinver
  description: Tasas, inflación, tipo de cambio y Bolsa (Banxico), México frente al mundo (Banco Mundial), potencial por estado (INEGI y DataMéxico) y red de sucursales oficiales.
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 12 hours
  filters_location_top: true

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
      field: mercado_mexico.fecha_month

  elements:
    - name: nav_header
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos) · **Contexto de mercado**'
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: '<div style=''background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;''><h2 style=''color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;''>Contexto de mercado</h2><p style=''color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;''>El entorno en el que compiten nuestros productos: tasas y CETES, inflación, dólar y Bolsa, cómo se compara México con la región y en qué estados hay potencial sin atender. Fuentes públicas: Banco de México, Banco Mundial, INEGI y DataMéxico.</p></div>'
      row: 1
      col: 0
      width: 24
      height: 3

    - name: kpi_tasa_objetivo
      title: Tasa objetivo Banxico
      model: actinver
      explore: mercado_mexico
      type: single_value
      fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
      filters:
        ctx_mercado_ultimo.serie_id: SF61745
      limit: 1
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Tasa objetivo Banxico
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: pb en 12 meses
      value_format: 0.00"%"
      row: 4
      col: 0
      width: 6
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_cetes28
      title: CETES 28 días
      model: actinver
      explore: mercado_mexico
      type: single_value
      fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
      filters:
        ctx_mercado_ultimo.serie_id: SF60633
      limit: 1
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: CETES 28 días
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: pb en 12 meses
      value_format: 0.00"%"
      row: 4
      col: 6
      width: 6
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_inflacion
      title: Inflación anual
      model: actinver
      explore: mercado_mexico
      type: single_value
      fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
      filters:
        ctx_mercado_ultimo.serie_id: SP30578
      limit: 1
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Inflación anual
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: pb en 12 meses
      value_format: 0.00"%"
      row: 4
      col: 12
      width: 6
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_dolar_fix
      title: Dólar FIX
      model: actinver
      explore: mercado_mexico
      type: single_value
      fields: [ctx_mercado_ultimo.valor_actual, ctx_mercado_ultimo.cambio_12_meses]
      filters:
        ctx_mercado_ultimo.serie_id: SF43718
      limit: 1
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Dólar FIX
      show_comparison: true
      comparison_type: change
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: '% en 12 meses'
      value_format: $0.00
      row: 4
      col: 18
      width: 6
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: titulo_linea_tasas_inflacion
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Le gana la tasa a la inflación? Tasa objetivo, CETES 28 e inflación anual<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 0
      width: 16
      height: 1

    - name: linea_tasas_inflacion
      title: ¿Le gana la tasa a la inflación? Tasa objetivo, CETES 28 e inflación anual
      model: actinver
      explore: mercado_mexico
      type: looker_line
      fields: [mercado_mexico.fecha_month, mercado_mexico.indicador, mercado_mexico.valor]
      pivots: [mercado_mexico.indicador]
      filters:
        mercado_mexico.serie_id: SF61745,SF60633,SP30578
      sorts: [mercado_mexico.fecha_month]
      limit: 500
      colors: ['#0f6ff5', '#12998a', '#d9704c']
      show_view_names: false
      show_value_labels: false
      interpolation: linear
      point_style: none
      x_axis_label: ''
      y_axis_value_format: 0.0"%"
      legend_position: center
      listen:
        Periodo: mercado_mexico.fecha_month
      row: 8
      col: 0
      width: 16
      height: 8
      title_hidden: true

    - name: titulo_linea_dolar
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Dólar FIX (promedio mensual)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 16
      width: 8
      height: 1

    - name: linea_dolar
      title: Dólar FIX (promedio mensual)
      model: actinver
      explore: mercado_mexico
      type: looker_area
      fields: [mercado_mexico.fecha_month, mercado_mexico.valor]
      filters:
        mercado_mexico.serie_id: SF43718
      sorts: [mercado_mexico.fecha_month]
      limit: 500
      colors: ['#ad883a']
      show_view_names: false
      interpolation: linear
      point_style: none
      x_axis_label: ''
      y_axis_value_format: $0.00
      y_axis_zero: false
      listen:
        Periodo: mercado_mexico.fecha_month
      row: 8
      col: 16
      width: 8
      height: 8
      title_hidden: true

    - name: titulo_linea_ipc_bolsa
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>La Bolsa: S&amp;P/BMV IPC al cierre de cada mes<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 16
      col: 0
      width: 12
      height: 1

    - name: linea_ipc_bolsa
      title: 'La Bolsa: S&P/BMV IPC al cierre de cada mes'
      model: actinver
      explore: mercado_mexico
      type: looker_area
      fields: [mercado_mexico.fecha_month, mercado_mexico.valor]
      filters:
        mercado_mexico.serie_id: SF4782
      sorts: [mercado_mexico.fecha_month]
      limit: 500
      colors: ['#0f6ff5']
      show_view_names: false
      interpolation: linear
      point_style: none
      x_axis_label: ''
      y_axis_value_format: '#,##0'
      y_axis_zero: false
      listen:
        Periodo: mercado_mexico.fecha_month
      row: 17
      col: 0
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_bar_sectores_bolsa
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Índices sectoriales de la Bolsa: cambio % en 12 meses<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 16
      col: 12
      width: 12
      height: 1

    - name: bar_sectores_bolsa
      title: 'Índices sectoriales de la Bolsa: cambio % en 12 meses'
      model: actinver
      explore: mercado_mexico
      type: looker_bar
      fields: [ctx_mercado_ultimo.indicador, ctx_mercado_ultimo.cambio_12_meses]
      filters:
        ctx_mercado_ultimo.serie_id: SF364756,SF364757,SF364758,SF364759,SF364760,SF364761
      sorts: [ctx_mercado_ultimo.cambio_12_meses desc]
      limit: 10
      colors: ['#12998a']
      show_view_names: false
      show_value_labels: true
      x_axis_label: ''
      row: 17
      col: 12
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_bar_inclusion_financiera
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Inclusión financiera: adultos con cuenta (%), último año disponible<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 24
      col: 0
      width: 12
      height: 1

    - name: bar_inclusion_financiera
      title: 'Inclusión financiera: adultos con cuenta (%), último año disponible'
      model: actinver
      explore: mexico_mundo
      type: looker_bar
      fields: [mexico_mundo.pais, mexico_mundo.valor]
      filters:
        mexico_mundo.serie_id: FX.OWN.TOTL.ZS
        mexico_mundo.es_ultimo_anio: 'Yes'
      sorts: [mexico_mundo.valor desc]
      limit: 10
      colors: ['#0f6ff5']
      show_view_names: false
      show_value_labels: true
      label_value_format: '0.0'
      x_axis_label: ''
      row: 25
      col: 0
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_linea_crecimiento_pib
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Crecimiento del PIB (%): México, América Latina y el mundo<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 24
      col: 12
      width: 12
      height: 1

    - name: linea_crecimiento_pib
      title: 'Crecimiento del PIB (%): México, América Latina y el mundo'
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
      colors: ['#0f6ff5', '#ad883a', '#8a94a3']
      show_view_names: false
      interpolation: linear
      x_axis_label: ''
      y_axis_value_format: '0.0'
      legend_position: center
      row: 25
      col: 12
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_mapa_sucursales_oficiales
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Red de sucursales oficiales (48) con su región comercial<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 32
      col: 0
      width: 10
      height: 1

    - name: mapa_sucursales_oficiales
      title: Red de sucursales oficiales (48) con su región comercial
      model: actinver
      explore: sucursales_oficiales
      type: looker_google_map
      fields: [sucursales_oficiales.ubicacion, sucursales_oficiales.nombre_oficial, sucursales_oficiales.region_oficial, sucursales_oficiales.count]
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
      map_marker_color: ['#0f6ff5']
      show_legend: false
      row: 33
      col: 0
      width: 10
      height: 9
      title_hidden: true

    - name: titulo_tabla_estados_sin_sucursal
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Estados con peso económico y sin sucursal: dónde crecer<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 32
      col: 10
      width: 14
      height: 1

    - name: tabla_estados_sin_sucursal
      title: 'Estados con peso económico y sin sucursal: dónde crecer'
      model: actinver
      explore: contexto_estatal
      type: looker_grid
      fields: [contexto_estatal.estado, contexto_estatal.participacion_pib, contexto_estatal.participacion_ied, contexto_estatal.poblacion, ctx_clientes_estado.clientes]
      filters:
        ctx_clientes_estado.tiene_sucursal: 'No'
      sorts: [contexto_estatal.participacion_pib desc]
      limit: 15
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      series_labels:
        contexto_estatal.participacion_pib: '% del PIB nacional'
        contexto_estatal.participacion_ied: '% de la inversión extranjera'
      series_cell_visualizations:
        contexto_estatal.participacion_pib:
          is_active: true
      row: 33
      col: 10
      width: 14
      height: 9
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'

    - name: nota_fuentes
      type: text
      title_text: ''
      body_text: '<p style=''font-size: 12px; color: #5B6678; margin: 0;''>Fuentes: Banco de México (SIE), Banco Mundial (WDI y Global Findex), INEGI y DataMéxico; se actualizan con la ingesta de <code>ingesta_contexto/</code>. Clientes y sucursales: datos internos sintéticos de demostración.</p>'
      row: 42
      col: 0
      width: 24
      height: 1
