- dashboard: vinculacion_cliente
  title: Vinculación — Portal Actinver
  description: Monitoreo de la escalera de tenencia, venta cruzada y afinidad de productos de inversión en Actinver.
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
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
      body_text: '**Vinculación** · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos) · [Contexto de mercado](/dashboards/actinver::contexto_mercado)'
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: '<div style=''background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;''><h2 style=''color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;''>Iniciativa: Vinculación del Cliente</h2><p style=''color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;''>Análisis de tenencia y diversificación de productos válidos de inversión, escalera de vinculación y afinidad de portafolios en Actinver.</p></div>'
      row: 1
      col: 0
      width: 24
      height: 3

    - name: clientes_con_tenencia
      title: Clientes con tenencia
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Clientes con tenencia
      value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
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

    - name: pct_solo_eje
      title: '% Solo eje'
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: '% Solo eje (por activar)'
      value_format: 0.0%
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
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

    - name: productos_promedio
      title: Productos promedio
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.productos_promedio]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Productos promedio por cliente
      value_format: '0.00'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
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

    - name: cuentas_abiertas
      title: Cuentas abiertas
      model: actinver
      explore: clientes
      type: single_value
      fields: [cuenta.fecha_apertura_month, cuenta.count]
      filters:
        cuenta.fecha_apertura_month: 24 months ago for 24 months
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [cuenta.fecha_apertura_month desc]
      limit: 500
      dynamic_fields:
        - table_calculation: variacion
          label: Variación
          expression: ${cuenta.count} / offset(${cuenta.count}, 1) - 1
          value_format_name: percent_1
          _kind_hint: measure
          _type_hint: number
      custom_color_enabled: true
      custom_color: '#FFFFFF'
      show_single_value_title: true
      single_value_title: Cuentas abiertas (último mes)
      show_comparison: true
      comparison_type: change
      comparison_label: vs mes anterior
      hidden_fields: [cuenta.fecha_apertura_month]
      value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
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

    - name: titulo_donde_se_atora_la_vinculacion
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Dónde se atora la vinculación? (clientes por escalón)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 0
      width: 16
      height: 1

    - name: donde_se_atora_la_vinculacion
      title: ¿Dónde se atora la vinculación? (clientes por escalón)
      model: actinver
      explore: clientes
      type: looker_column
      fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      show_view_names: false
      show_value_labels: true
      colors: ['#0f6ff5']
      x_axis_label: Escalón
      y_axis_gridlines: true
      hide_legend: true
      label_value_format: '#,##0'
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 8
      col: 0
      width: 16
      height: 7
      title_hidden: true

    - name: titulo_pct_multiproducto_gauge
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>% Multiproducto (2 o más productos)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 7
      col: 16
      width: 8
      height: 1

    - name: pct_multiproducto_gauge
      title: '% Multiproducto (2 o más productos)'
      model: actinver
      explore: clientes
      type: marketplace_viz_radial_gauge::radial_gauge-marketplace
      fields: [dt_escalera_vinculacion.pct_multiproducto]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      fill_color: '#0f6ff5'
      background_color: '#d9d9d9'
      range_min: 0
      range_max: 1
      value_formatting: 0.0%
      range_formatting: 0%
      value_label_type: value
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 8
      col: 16
      width: 8
      height: 7
      title_hidden: true

    - name: titulo_que_productos_tienen_nuestros_clientes
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué productos tienen nuestros clientes? (% de clientes con tenencia)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 15
      col: 0
      width: 12
      height: 1

    - name: que_productos_tienen_nuestros_clientes
      title: ¿Qué productos tienen nuestros clientes? (% de clientes con tenencia)
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [cliente_producto_09_10_2026.count, cliente_producto_09_10_2026.penetracion_fondos_deuda, cliente_producto_09_10_2026.penetracion_reporto, cliente_producto_09_10_2026.penetracion_renta_variable, cliente_producto_09_10_2026.penetracion_prlv]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      dynamic_fields:
        - table_calculation: fondos_de_deuda
          label: Fondos de deuda
          expression: ${cliente_producto_09_10_2026.penetracion_fondos_deuda} / ${cliente_producto_09_10_2026.count}
          value_format_name: percent_1
          _kind_hint: measure
        - table_calculation: mercado_de_dinero_reporto
          label: Mercado de dinero reporto
          expression: ${cliente_producto_09_10_2026.penetracion_reporto} / ${cliente_producto_09_10_2026.count}
          value_format_name: percent_1
          _kind_hint: measure
        - table_calculation: renta_variable
          label: Renta variable
          expression: ${cliente_producto_09_10_2026.penetracion_renta_variable} / ${cliente_producto_09_10_2026.count}
          value_format_name: percent_1
          _kind_hint: measure
        - table_calculation: prlv
          label: PRLV
          expression: ${cliente_producto_09_10_2026.penetracion_prlv} / ${cliente_producto_09_10_2026.count}
          value_format_name: percent_1
          _kind_hint: measure
      hidden_fields: [cliente_producto_09_10_2026.count, cliente_producto_09_10_2026.penetracion_fondos_deuda, cliente_producto_09_10_2026.penetracion_reporto, cliente_producto_09_10_2026.penetracion_renta_variable, cliente_producto_09_10_2026.penetracion_prlv]
      colors: ['#0f6ff5', '#12998a', '#ad883a', '#8573e8']
      show_view_names: false
      show_value_labels: true
      label_value_format: 0.0%
      legend_position: center
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 16
      col: 0
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_con_que_entidad_dan_el_primer_paso
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Con qué entidad dan el primer paso? (clientes Eje + 1)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 15
      col: 12
      width: 12
      height: 1

    - name: con_que_entidad_dan_el_primer_paso
      title: ¿Con qué entidad dan el primer paso? (clientes Eje + 1)
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [cuenta.tipo_entidad_bancaria, dt_escalera_vinculacion.count]
      filters:
        cuenta.tipo_entidad_bancaria: -NULL
        dt_escalera_vinculacion.escalon_vinculacion: Eje + 1
      inner_radius: 55
      colors: ['#0f6ff5', '#12998a', '#ad883a']
      value_labels: labels
      label_type: labPer
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 16
      col: 12
      width: 12
      height: 7
      title_hidden: true

    - name: titulo_centros_con_mas_clientes_solo_eje
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>Centros con más clientes solo eje (oportunidad)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 23
      col: 0
      width: 12
      height: 1

    - name: centros_con_mas_clientes_solo_eje
      title: Centros con más clientes solo eje (oportunidad)
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.pct_solo_eje]
      filters:
        catcentrofinanciero.centro_financiero: -NULL
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_escalera_vinculacion.pct_solo_eje desc]
      limit: 15
      colors: ['#e3a33b']
      show_view_names: false
      show_value_labels: true
      label_value_format: 0.0%
      hide_legend: true
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 24
      col: 0
      width: 12
      height: 8
      title_hidden: true

    - name: titulo_que_productos_van_juntos
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué productos van juntos? (afinidad, top 20 por lift)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 23
      col: 12
      width: 12
      height: 1

    - name: que_productos_van_juntos
      title: ¿Qué productos van juntos? (afinidad, top 20 por lift)
      model: actinver
      explore: afinidad_productos
      type: looker_grid
      fields: [afinidad_productos.producto_origen, afinidad_productos.producto_destino, afinidad_productos.clientes_con_ambos, afinidad_productos.lift_promedio]
      sorts: [afinidad_productos.lift_promedio desc]
      limit: 20
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
          fields: [afinidad_productos.lift_promedio]
      series_labels:
        afinidad_productos.producto_origen: Tiene
        afinidad_productos.producto_destino: Le ofrecemos
        afinidad_productos.clientes_con_ambos: Clientes con ambos
        afinidad_productos.lift_promedio: Lift
      row: 24
      col: 12
      width: 12
      height: 8
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'

    - name: titulo_que_le_ofrezco_a_cada_cliente
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué le ofrezco a cada cliente y por qué?<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 32
      col: 0
      width: 24
      height: 1

    - name: que_le_ofrezco_a_cada_cliente
      title: ¿Qué le ofrezco a cada cliente y por qué?
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [clientes.id_cliente_num, dt_escalera_vinculacion.escalon_vinculacion, dt_siguiente_producto_sugerido.siguiente_producto_sugerido, dt_siguiente_producto_sugerido.pct_grupo_que_lo_tiene, dt_siguiente_producto_sugerido.lift_estimado, dt_siguiente_producto_sugerido.razon_recomendacion, catcentrofinanciero.centro_financiero]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: -NULL
      sorts: [dt_siguiente_producto_sugerido.lift_estimado desc]
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
          fields: [dt_siguiente_producto_sugerido.lift_estimado]
      series_labels:
        clientes.id_cliente_num: Cliente
        dt_escalera_vinculacion.escalon_vinculacion: Escalón
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido: Producto sugerido
        dt_siguiente_producto_sugerido.pct_grupo_que_lo_tiene: '% de su grupo que lo tiene'
        dt_siguiente_producto_sugerido.lift_estimado: Lift
        dt_siguiente_producto_sugerido.razon_recomendacion: ¿Por qué?
        catcentrofinanciero.centro_financiero: Centro
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 33
      col: 0
      width: 24
      height: 9
      title_hidden: true
      header_background_color: '#1A2433'
      header_font_color: '#FFFFFF'

    - name: titulo_bar_siguiente_producto
      type: text
      title_text: ''
      subtitle_text: ''
      body_text: '<div style=''display:flex; align-items:center; justify-content:center; font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F; width:100%;''><div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div>¿Qué producto conviene ofrecer primero? (clientes por siguiente producto sugerido)<div style=''flex:1; height:2px; background-color:#002D6F; margin:0 12px;''></div></div>'
      row: 42
      col: 0
      width: 24
      height: 1

    - name: bar_siguiente_producto
      title: ¿Qué producto conviene ofrecer primero? (clientes por siguiente producto sugerido)
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [dt_siguiente_producto_sugerido.siguiente_producto_sugerido, dt_siguiente_producto_sugerido.count]
      filters:
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido: -NULL
      sorts: [dt_siguiente_producto_sugerido.count desc]
      limit: 12
      colors: ['#12998a']
      show_view_names: false
      show_value_labels: true
      label_value_format: '#,##0'
      x_axis_label: ''
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 43
      col: 0
      width: 24
      height: 7
      title_hidden: true
