- dashboard: polizas
  title: Pólizas y Seguros — Portal Actinver
  description: Monitoreo de puntualidad de cobranza, domiciliación, vencimientos de cartera y emisión de primas.
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  filters_location_top: true

  filters:
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
      field: producto.lob

    - name: producto
      title: Producto
      type: field_filter
      default_value: ''
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      model: actinver
      explore: primas
      field: producto.producto

  elements:
    - name: nav_header
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '[Vinculación](/dashboards/actinver::vinculacion_cliente) · **Seguros** · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos) · [Contexto de mercado](/dashboards/actinver::contexto_mercado)'
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: '<div style=''background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;''><h2 style=''color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;''>Iniciativa: Pólizas y Seguros</h2><p style=''color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;''>Monitoreo de emisión, renovación, cobranza a tiempo y domiciliación de pólizas de seguros por línea de negocio y asesor patrimonial.</p></div>'
      row: 1
      col: 0
      width: 24
      height: 3

    - name: kpi_prima_neta
      title: Prima Neta Emitida
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.fecha_emision_poliza_month, primas.prima_neta_emitida]
      filters:
        primas.fecha_emision_poliza_month: 24 months ago for 24 months
      sorts: [primas.fecha_emision_poliza_month desc]
      limit: 500
      dynamic_fields:
        - table_calculation: variacion
          label: Variación
          expression: ${primas.prima_neta_emitida} / offset(${primas.prima_neta_emitida}, 1) - 1
          value_format_name: percent_1
          _kind_hint: measure
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Prima Neta Emitida (último mes)
      show_comparison: true
      comparison_type: change
      comparison_label: vs mes anterior
      hidden_fields: [primas.fecha_emision_poliza_month]
      value_format: $#,##0
      listen:
        lob: producto.lob
        producto: producto.producto
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

    - name: kpi_polizas_emitidas
      title: Pólizas emitidas
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.count_polizas]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Pólizas emitidas
      value_format: '#,##0'
      listen:
        lob: producto.lob
        producto: producto.producto
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

    - name: kpi_polizas_renovadas
      title: Pólizas renovadas
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.count_polizas]
      filters:
        primas.id_tipo_transaccion: '2'
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Pólizas renovadas
      value_format: '#,##0'
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 4
      col: 10
      width: 4
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_recibos_cobrados
      title: Recibos cobrados
      model: actinver
      explore: cobranza
      type: single_value
      fields: [cobranza.fecha_pago_month, cobranza.total_recibos]
      filters:
        cobranza.fecha_pago_month: 24 months ago for 24 months
      sorts: [cobranza.fecha_pago_month desc]
      limit: 500
      dynamic_fields:
        - table_calculation: variacion
          label: Variación
          expression: ${cobranza.total_recibos} / offset(${cobranza.total_recibos}, 1) - 1
          value_format_name: percent_1
          _kind_hint: measure
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Recibos cobrados (último mes)
      show_comparison: true
      comparison_type: change
      comparison_label: vs mes anterior
      hidden_fields: [cobranza.fecha_pago_month]
      value_format: '#,##0'
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 4
      col: 14
      width: 5
      height: 3
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting:
        - type: not null
          value: []
          background_color: '#002D6F'
          font_color: '#FFFFFF'

    - name: kpi_desviacion_promedio
      title: Desviación promedio
      model: actinver
      explore: cobranza
      type: single_value
      fields: [cobranza.desviacion_promedio_dias]
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Desviación promedio (días)
      value_format: '0.0'
      listen:
        lob: producto.lob
        producto: producto.producto
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

    - name: titulo_gauge_cobranza_a_tiempo
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>% Cobranza a tiempo<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 0
      width: 6
      height: 1

    - name: gauge_cobranza_a_tiempo
      title: '% Cobranza a tiempo'
      model: actinver
      explore: cobranza
      type: marketplace_viz_radial_gauge::radial_gauge-marketplace
      fields: [cobranza.pct_recibos_a_tiempo]
      fill_color: '#0f6ff5'
      background_color: '#d9d9d9'
      range_min: 0
      range_max: 1
      value_formatting: 0.0%
      range_formatting: 0%
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 8
      col: 0
      width: 6
      height: 6
      title_hidden: true

    - name: titulo_gauge_renovacion
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>% Renovación<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 6
      width: 6
      height: 1

    - name: gauge_renovacion
      title: '% Renovación'
      model: actinver
      explore: primas
      type: marketplace_viz_radial_gauge::radial_gauge-marketplace
      fields: [primas.id_tipo_transaccion, primas.count_polizas]
      filters:
        primas.id_tipo_transaccion: 1,2
      dynamic_fields:
        - table_calculation: pct_renovacion
          label: '% Renovación'
          expression: sum(if(${primas.id_tipo_transaccion} = 2, ${primas.count_polizas}, 0)) / sum(${primas.count_polizas})
          value_format_name: percent_1
          _kind_hint: measure
      hidden_fields: [primas.id_tipo_transaccion, primas.count_polizas]
      fill_color: '#0f6ff5'
      background_color: '#d9d9d9'
      range_min: 0
      range_max: 1
      value_formatting: 0.0%
      range_formatting: 0%
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 8
      col: 6
      width: 6
      height: 6
      title_hidden: true

    - name: titulo_treemap_primas_lob_producto
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Distribución de prima por línea de negocio y producto<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 12
      width: 12
      height: 1

    - name: treemap_primas_lob_producto
      title: Distribución de prima por línea de negocio y producto
      model: actinver
      explore: primas
      type: looker_column
      fields: [producto.lob, producto.producto, primas.prima_neta_emitida]
      pivots: [producto.lob]
      filters:
        primas.prima_neta_emitida: '>0'
      advanced_vis_config: '{ chart: { type: ''treemap'' } }'
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 8
      col: 12
      width: 12
      height: 6
      title_hidden: true

    - name: titulo_dona_cobranza_tiempo
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué cobramos a tiempo?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 14
      col: 0
      width: 8
      height: 1

    - name: dona_cobranza_tiempo
      title: ¿Qué cobramos a tiempo?
      model: actinver
      explore: cobranza
      type: looker_pie
      fields: [cobranza.rango_desviacion_pago, cobranza.total_recibos]
      inner_radius: 50
      colors: ['#3dbe7a', '#12998a', '#e3a33b', '#f0645a']
      show_view_names: false
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 15
      col: 0
      width: 8
      height: 7
      title_hidden: true

    - name: titulo_col_domiciliadas_desviacion
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Las pólizas domiciliadas pagan con menos atraso?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 14
      col: 8
      width: 8
      height: 1

    - name: col_domiciliadas_desviacion
      title: ¿Las pólizas domiciliadas pagan con menos atraso?
      model: actinver
      explore: cobranza
      type: looker_column
      fields: [domiciliado.es_domiciliada, cobranza.desviacion_promedio_dias]
      colors: ['#0f6ff5']
      show_view_names: false
      show_value_labels: true
      label_value_format: '0.0'
      y_axis_gridlines: true
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 15
      col: 8
      width: 8
      height: 7
      title_hidden: true

    - name: titulo_bar_atraso_por_lob
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Dónde se concentra el atraso?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 14
      col: 16
      width: 8
      height: 1

    - name: bar_atraso_por_lob
      title: ¿Dónde se concentra el atraso?
      model: actinver
      explore: cobranza
      type: looker_bar
      fields: [producto.lob, cobranza.pct_recibos_criticos]
      sorts: [cobranza.pct_recibos_criticos desc]
      colors: ['#f0645a']
      show_view_names: false
      show_value_labels: true
      label_value_format: 0.0%
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 15
      col: 16
      width: 8
      height: 7
      title_hidden: true

    - name: titulo_area_prima_mensual_lob
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Prima emitida mensual por línea de negocio<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 22
      col: 0
      width: 16
      height: 1

    - name: area_prima_mensual_lob
      title: Prima emitida mensual por línea de negocio
      model: actinver
      explore: primas
      type: looker_column
      fields: [primas.fecha_emision_poliza_month, producto.lob, primas.prima_neta_emitida]
      pivots: [producto.lob]
      filters:
        primas.fecha_emision_poliza_month: 24 months ago for 24 months
      stacking: normal
      colors: ['#0f6ff5', '#12998a', '#ad883a', '#8573e8', '#d9704c']
      show_view_names: false
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 23
      col: 0
      width: 16
      height: 7
      title_hidden: true

    - name: titulo_col_nuevo_vs_renovacion
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Nuevo negocio o renovación?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 22
      col: 16
      width: 8
      height: 1

    - name: col_nuevo_vs_renovacion
      title: ¿Nuevo negocio o renovación?
      model: actinver
      explore: primas
      type: looker_column
      fields: [primas.tipo_transaccion, primas.count_polizas]
      filters:
        primas.id_tipo_transaccion: 1,2
      colors: ['#0f6ff5', '#12998a']
      show_view_names: false
      show_value_labels: true
      label_value_format: '#,##0'
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 23
      col: 16
      width: 8
      height: 7
      title_hidden: true

    - name: titulo_tabla_vencimientos_90_dias
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué pólizas vencen en los próximos 90 días?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 30
      col: 0
      width: 12
      height: 1

    - name: tabla_vencimientos_90_dias
      title: ¿Qué pólizas vencen en los próximos 90 días?
      model: actinver
      explore: polizas
      type: looker_grid
      fields: [polizas.poliza, producto.producto, producto.lob, catasesor.asesor_etiqueta, polizas.fecha_fin_vigencia_date]
      filters:
        polizas.fecha_fin_vigencia_date: today for 90 days
      sorts: [polizas.fecha_fin_vigencia_date asc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      series_labels:
        polizas.poliza: Póliza
        producto.producto: Producto
        producto.lob: Línea de negocio
        catasesor.asesor_etiqueta: Asesor
        polizas.fecha_fin_vigencia_date: Fin Vigencia
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 31
      col: 0
      width: 12
      height: 8
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'

    - name: titulo_tabla_ofrecer_domiciliar
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿A quién le ofrecemos domiciliar?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 30
      col: 12
      width: 12
      height: 1

    - name: tabla_ofrecer_domiciliar
      title: ¿A quién le ofrecemos domiciliar?
      model: actinver
      explore: cobranza
      type: looker_grid
      fields: [cobranza.poliza, producto.producto, catasesor.asesor_etiqueta, cobranza.dias_desviacion, cobranza.monto_prima_pagada]
      filters:
        domiciliado.es_domiciliada: 'No'
        cobranza.es_critico: 'Yes'
      sorts: [cobranza.dias_desviacion desc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value: null
          background_color: null
          font_color: null
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
          bold: false
          italic: false
          strikethrough: false
          fields: [cobranza.dias_desviacion]
      series_labels:
        cobranza.poliza: Póliza
        producto.producto: Producto
        catasesor.asesor_etiqueta: Asesor
        cobranza.dias_desviacion: Días de Desviación
        cobranza.monto_prima_pagada: Prima Pagada
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 31
      col: 12
      width: 12
      height: 8
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'

    - name: titulo_col_polizas_por_vencer
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Cuántas pólizas vencen en los próximos 30, 60 y 90 días?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 39
      col: 0
      width: 24
      height: 1

    - name: col_polizas_por_vencer
      title: ¿Cuántas pólizas vencen en los próximos 30, 60 y 90 días?
      model: actinver
      explore: polizas
      type: looker_column
      fields: [dt_vencimientos_seguros.ventana_vencimiento, dt_vencimientos_seguros.polizas_por_vencer_count]
      filters:
        dt_vencimientos_seguros.ventana_vencimiento: 1. Por vencer (30 días),2. Por vencer (60 días),3. Por vencer (90 días)
      sorts: [dt_vencimientos_seguros.ventana_vencimiento]
      colors: ['#0f6ff5']
      show_view_names: false
      show_value_labels: true
      x_axis_label: ''
      listen:
        lob: producto.lob
        producto: producto.producto
      row: 40
      col: 0
      width: 24
      height: 7
      title_hidden: true
