- dashboard: geografia
  title: Inteligencia Geográfica
  description: Distribución territorial de clientes y pólizas, cobertura por estado y centros financieros de Actinver.
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

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
      field: catcentrofinanciero.centro_financiero
      listens_to_filters: [Estado]

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
      field: clientes.tipo_persona_desc

  elements:
    - name: nav_header
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · **Geografía** · [Calidad de datos](/dashboards/actinver::calidad_datos) · [Contexto de mercado](/dashboards/actinver::contexto_mercado)'
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: '<div style=''background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;''><h2 style=''color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;''>Iniciativa: Inteligencia Geográfica</h2><p style=''color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;''>Mapeo de cobertura y clientes utilizando la red territorial de centros financieros y división oficial por entidad federativa.</p></div>'
      row: 1
      col: 0
      width: 24
      height: 3

    - name: kpi_estados_cobertura
      title: Entidades con Cobertura
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.total_estados_cobertura]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Estados Cubiertos
      value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 0
      width: 5
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_total_centros
      title: Centros Financieros
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.count]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Total Centros
      value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 5
      width: 5
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_clientes_tenencia
      title: Clientes con Tenencia
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Clientes Activos
      value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 10
      width: 5
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_pct_solo_eje
      title: '% Solo Eje'
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: '% Oportunidad Solo Eje'
      value_format: 0.0%
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 15
      width: 4
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_productos_promedio
      title: Productos Promedio
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.productos_promedio]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Productos / Cliente
      value_format: '0.00'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 19
      width: 5
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: titulo_map_clientes_estado
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Dónde están mis clientes y la cobertura? (Mapa de México)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 0
      width: 14
      height: 1

    - name: map_clientes_estado
      title: ¿Dónde están mis clientes y la cobertura? (Mapa de México)
      model: actinver
      explore: clientes
      type: looker_geo_choropleth
      fields: [catcentrofinanciero.estado_nombre, dt_escalera_vinculacion.count]
      filters:
        catcentrofinanciero.estado_nombre: -Sin ubicación física,-Otra Entidad
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.count desc]
      limit: 50
      map: actinver::mexico_estados
      map_layer_name: actinver::mexico_estados
      map_projection: ''
      show_view_names: false
      quantize_colors: false
      colors: ['#E8F0FE', '#87B7FA', '#0F6FF5']
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 8
      col: 0
      width: 14
      height: 10
      title_hidden: true

    - name: titulo_chart_top_centros
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Top 15 centros financieros por clientes con tenencia<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 14
      width: 10
      height: 1

    - name: chart_top_centros
      title: Top 15 centros financieros por clientes con tenencia
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.count desc]
      limit: 15
      colors: ['#0f6ff5']
      show_view_names: false
      show_value_labels: true
      label_value_format: '#,##0'
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 8
      col: 14
      width: 10
      height: 10
      title_hidden: true

    - name: titulo_chart_apertura_mes
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Cómo evoluciona la apertura de clientes en el territorio?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 18
      col: 0
      width: 10
      height: 1

    - name: chart_apertura_mes
      title: ¿Cómo evoluciona la apertura de clientes en el territorio?
      model: actinver
      explore: clientes
      type: looker_area
      fields: [cuenta.fecha_apertura_month, dt_escalera_vinculacion.count]
      filters:
        cuenta.fecha_apertura_month: 24 months
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [cuenta.fecha_apertura_month asc]
      colors: ['#0f6ff5']
      show_view_names: false
      x_axis_gridlines: false
      y_axis_gridlines: true
      point_style: none
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 19
      col: 0
      width: 10
      height: 8
      title_hidden: true

    - name: titulo_table_desglose_estado_centro
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Desglose territorial: Estado, Centro, Clientes y Vinculación<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 18
      col: 10
      width: 14
      height: 1

    - name: table_desglose_estado_centro
      title: 'Desglose territorial: Estado, Centro, Clientes y Vinculación'
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [catcentrofinanciero.estado_nombre, catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.count, dt_escalera_vinculacion.pct_solo_eje, dt_escalera_vinculacion.productos_promedio, clientes.clientes_con_seguro]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.count desc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'
      color_application:
        collection_id: custom
        custom:
          id: actinver-azul
          label: Actinver azul
          type: continuous
          stops:
            - color: '#e8f0fe'
              offset: 0
            - color: '#87b7fa'
              offset: 50
            - color: '#0f6ff5'
              offset: 100
        options:
          steps: 5
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 19
      col: 10
      width: 14
      height: 8
      title_hidden: true

    - name: titulo_tabla_potencial_estatal
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Dónde hay potencial? Peso económico del estado frente a nuestros clientes (INEGI y DataMéxico)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 27
      col: 0
      width: 24
      height: 1

    - name: tabla_potencial_estatal
      title: ¿Dónde hay potencial? Peso económico del estado frente a nuestros clientes (INEGI y DataMéxico)
      model: actinver
      explore: contexto_estatal
      type: looker_grid
      fields: [contexto_estatal.estado, contexto_estatal.participacion_pib, contexto_estatal.participacion_ied, contexto_estatal.ingreso_hogar, ctx_clientes_estado.sucursales, ctx_clientes_estado.clientes, ctx_clientes_estado.clientes_por_100k]
      sorts: [contexto_estatal.participacion_pib desc]
      limit: 32
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value: null
          background_color: null
          font_color: null
          color_application:
            collection_id: legacy
            palette_id: legacy_sequential2
            options:
              steps: 5
          bold: false
          italic: false
          strikethrough: false
          fields: [ctx_clientes_estado.clientes_por_100k]
        - type: equal to
          value: 0
          background_color: '#fdecea'
          font_color: '#b3261e'
          color_application: null
          bold: true
          italic: false
          strikethrough: false
          fields: [ctx_clientes_estado.sucursales]
      series_labels:
        contexto_estatal.participacion_pib: '% del PIB nacional'
        contexto_estatal.participacion_ied: '% de la inversión extranjera'
        ctx_clientes_estado.clientes_por_100k: Clientes por 100 mil hab.
      series_cell_visualizations:
        contexto_estatal.participacion_pib:
          is_active: true
      row: 28
      col: 0
      width: 24
      height: 9
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'
