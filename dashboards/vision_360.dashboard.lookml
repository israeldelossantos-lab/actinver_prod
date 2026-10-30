- dashboard: vision_360
  title: "Visión 360 del Cliente — Portal Actinver"
  description: "Perfil demográfico, segmentación patrimonial AWM, tenencia de seguros y cartera por asesor."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  filters_location_top: true

  filters:
    - name: Estado
      title: Estado
      type: field_filter
      default_value: ""
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
      default_value: ""
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
      default_value: ""
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
      default_value: ""
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
      default_value: ""
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
      title_text: ""
      subtitle_text: ""
      body_text: "[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · **Visión 360** · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos)"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 16px 24px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Visión 360 del Cliente</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Perfil integral de clientes, distribución de cartera Banco vs Casa de Bolsa, penetración de seguros y tenencia patrimonial AWM.</p></div>"
      row: 1
      col: 0
      width: 24
      height: 2

    - name: kpi_total_clientes
      title: "Total Clientes"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.count]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Total Clientes"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 0
      width: 5
      height: 3

    - name: kpi_clientes_tenencia
      title: "Clientes con portafolio"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Clientes con Portafolio"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 5
      width: 5
      height: 3

    - name: kpi_clientes_patrimoniales
      title: "Clientes AWM Patrimonial"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.clientes_patrimoniales_awm]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Clientes Patrimoniales (AWM)"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 10
      width: 4
      height: 3

    - name: kpi_clientes_con_seguro
      title: "Clientes con seguro"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.clientes_con_seguro]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Clientes con Seguro"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 14
      width: 5
      height: 3

    - name: kpi_pct_tenencia_seguro
      title: "% Con seguro"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.pct_clientes_con_seguro]
      custom_color_enabled: true
      custom_color: "#12998a"
      show_single_value_title: true
      single_value_title: "% Clientes con Seguro"
      value_format: "0.0%"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 19
      width: 5
      height: 3

    - name: dona_entidad_banco_bolsa
      title: "Banco vs Casa de Bolsa"
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [cuenta.tipo_entidad_bancaria, clientes.count]
      filters:
        cuenta.tipo_entidad_bancaria: "-NULL"
      inner_radius: 50
      colors: ["#0f6ff5", "#12998a"]
      show_view_names: false
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 0
      width: 8
      height: 6

    - name: dona_tipo_persona
      title: "Tipo de persona (Física vs Moral)"
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [clientes.tipo_persona_desc, clientes.count]
      inner_radius: 50
      colors: ["#0f6ff5", "#ad883a"]
      show_view_names: false
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 8
      width: 8
      height: 6

    - name: dona_con_seguro
      title: "Penetración de seguro en cartera"
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [clientes.cliente_seguro, clientes.count]
      inner_radius: 50
      colors: ["#12998a", "#d9d9d9"]
      show_view_names: false
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 16
      width: 8
      height: 6

    - name: col_venta_cruzada_seguro_escalon
      title: "Venta cruzada: ¿Tienen seguro los clientes más vinculados?"
      model: actinver
      explore: clientes
      type: looker_column
      fields:
        - dt_escalera_vinculacion.escalon_vinculacion
        - clientes.cliente_seguro
        - dt_escalera_vinculacion.count
      pivots: [clientes.cliente_seguro]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      stacking: normal
      colors: ["#0f6ff5", "#12998a"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      x_axis_label: "Escalón"
      y_axis_combined: true
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 10
      col: 0
      width: 14
      height: 7

    - name: area_altas_clientes_mes
      title: "Altas históricas de clientes por mes"
      model: actinver
      explore: clientes
      type: looker_area
      fields: [clientes.fecha_hora_creacion_month, clientes.count]
      filters:
        clientes.fecha_hora_creacion_month: 36 months ago for 36 months
      colors: ["#0f6ff5"]
      show_view_names: false
      x_axis_label: "Mes de Alta"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 10
      col: 14
      width: 10
      height: 7

    - name: bar_tipo_contrato
      title: "Clientes por tipo de contrato"
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [cattipocontrato.tipo_contrato, clientes.count]
      sorts: [clientes.count desc]
      colors: ["#0f6ff5"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 17
      col: 0
      width: 12
      height: 7

    - name: bar_asesores_clientes_seguro
      title: "Asesores con más clientes con seguro"
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catasesor.asesor_etiqueta, clientes.clientes_con_seguro]
      sorts: [clientes.clientes_con_seguro desc]
      limit: 15
      colors: ["#12998a"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 17
      col: 12
      width: 12
      height: 7

    - name: tabla_ficha_360
      title: "Ficha 360: Clientes y vinculación"
      model: actinver
      explore: clientes
      type: looker_grid
      fields:
        - clientes.foto
        - clientes.id_cliente_num
        - clientes.tipo_persona_desc
        - dt_escalera_vinculacion.escalon_vinculacion
        - dt_escalera_vinculacion.total_productos_validos
        - clientes.segmento_awm
        - clientes.cliente_seguro
        - catcentrofinanciero.centro_financiero
        - catasesor.asesor_etiqueta
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      sorts: [dt_escalera_vinculacion.total_productos_validos desc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value:
          background_color:
          font_color:
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
          bold: false
          italic: false
          strikethrough: false
          fields: [dt_escalera_vinculacion.total_productos_validos]
      series_labels:
        clientes.foto: Foto
        clientes.id_cliente_num: Cliente
        clientes.tipo_persona_desc: Persona
        dt_escalera_vinculacion.escalon_vinculacion: Escalón
        dt_escalera_vinculacion.total_productos_validos: Productos
        clientes.segmento_awm: AWM
        clientes.cliente_seguro: Seguro
        catcentrofinanciero.centro_financiero: Centro
        catasesor.asesor_etiqueta: Asesor
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 24
      col: 0
      width: 24
      height: 9
