- dashboard: sucursal_detalle
  title: 'Detalle de Sucursal: Clientes y Oportunidad'
  description: 'Drill de clientes por centro financiero: escalón de vinculación, tenencia de productos, seguros y productos sugeridos.'
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: Centro financiero
      title: Centro financiero
      type: field_filter
      default_value: JAL GUADALAJARA AV AMERICA
      allow_multiple_values: false
      required: true
      ui_config:
        type: dropdown_menu
        display: inline
      model: actinver
      explore: clientes
      field: catcentrofinanciero.centro_financiero

  elements:
    - name: nav_header
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '[← Volver a Sucursales](/dashboards/actinver::desempeno_sucursales) · [Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos) · [Contexto de mercado](/dashboards/actinver::contexto_mercado)'
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: '<div style=''background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;''><h2 style=''color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;''>Detalle de Sucursal: Clientes y Oportunidad</h2><p style=''color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;''>Perfil detallado del centro financiero, clientes asignados, distribución por escalón y catálogo de siguiente mejor producto.</p></div>'
      row: 1
      col: 0
      width: 24
      height: 3

    - name: kpi_clientes_sucursal
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
      single_value_title: Total Clientes
      value_format: '#,##0'
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
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
        Centro financiero: catcentrofinanciero.centro_financiero
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
        Centro financiero: catcentrofinanciero.centro_financiero
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

    - name: kpi_pct_con_seguro
      title: '% con Seguro'
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
      dynamic_fields:
        - table_calculation: pct_seguro
          label: '% con Seguro'
          expression: ${clientes.clientes_con_seguro} / ${dt_escalera_vinculacion.count}
          value_format_name: percent_1
      hidden_fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Penetración de Seguros
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
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

    - name: titulo_chart_distribucion_escalon
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Distribución de clientes por escalón de vinculación en la sucursal<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 0
      width: 14
      height: 1

    - name: chart_distribucion_escalon
      title: Distribución de clientes por escalón de vinculación en la sucursal
      model: actinver
      explore: clientes
      type: looker_column
      fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.escalon_vinculacion asc]
      colors: ['#0f6ff5']
      show_view_names: false
      show_value_labels: true
      label_value_format: '#,##0'
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 8
      col: 0
      width: 14
      height: 6
      title_hidden: true

    - name: titulo_table_clientes_sucursal
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Clientes de la sucursal: portafolio y siguiente mejor producto<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 14
      col: 0
      width: 24
      height: 1

    - name: table_clientes_sucursal
      title: 'Clientes de la sucursal: portafolio y siguiente mejor producto'
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [clientes.foto, clientes.id_cliente_num, clientes.tipo_persona_desc, dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.total_productos_validos, clientes.cliente_seguro, clientes.segmento_awm, clientes.fecha_hora_creacion_date, dt_siguiente_producto_sugerido.siguiente_producto_sugerido]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.total_productos_validos desc]
      limit: 200
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
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 15
      col: 0
      width: 24
      height: 12
      title_hidden: true

    - name: titulo_bar_sugeridos_sucursal
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Productos sugeridos para los clientes de la sucursal<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 14
      width: 10
      height: 1

    - name: bar_sugeridos_sucursal
      title: Productos sugeridos para los clientes de la sucursal
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [dt_siguiente_producto_sugerido.siguiente_producto_sugerido, dt_siguiente_producto_sugerido.count]
      filters:
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido: -NULL
      sorts: [dt_siguiente_producto_sugerido.count desc]
      limit: 8
      colors: ['#12998a']
      show_view_names: false
      show_value_labels: true
      label_value_format: '#,##0'
      x_axis_label: ''
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 8
      col: 14
      width: 10
      height: 6
      title_hidden: true
