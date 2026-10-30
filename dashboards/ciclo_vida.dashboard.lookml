- dashboard: ciclo_vida
  title: "Ciclo de Vida del Cliente — Portal Actinver"
  description: "Monitoreo de cohortes de apertura, estatus de clientes y cuentas, cancelaciones y maduración de cartera."
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

    - name: lob
      title: "Línea de negocio"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      model: actinver
      explore: primas
      field: producto.lob

  elements:
    - name: nav_header
      type: text
      title_text: ""
      subtitle_text: ""
      body_text: "[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · **Ciclo de vida** · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos)"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 16px 24px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Ciclo de Vida del Cliente</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Evolución temporal de altas, maduración de cohortes, estatus de cuentas y retención de pólizas en Actinver.</p></div>"
      row: 1
      col: 0
      width: 24
      height: 2

    - name: kpi_clientes_tenencia
      title: "Clientes con tenencia"
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
      col: 0
      width: 5
      height: 3

    - name: kpi_cuentas_abiertas
      title: "Cuentas abiertas"
      model: actinver
      explore: clientes
      type: single_value
      fields: [cuenta.fecha_apertura_month, cuenta.count]
      filters:
        cuenta.fecha_apertura_month: 24 months ago for 24 months
      sorts: [cuenta.fecha_apertura_month desc]
      limit: 500
      dynamic_fields:
        - table_calculation: variacion
          label: Variación
          expression: "${cuenta.count} / offset(${cuenta.count}, 1) - 1"
          value_format_name: percent_1
          _kind_hint: measure
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Cuentas abiertas (último mes)"
      show_comparison: true
      comparison_type: change
      comparison_label: "vs mes anterior"
      hidden_fields: [cuenta.fecha_apertura_month]
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

    - name: kpi_pct_multiproducto
      title: "% Multiproducto"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_multiproducto]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "% Multiproducto (2+ productos)"
      value_format: "0.0%"
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

    - name: kpi_prima_cancelada
      title: "Prima cancelada"
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.fecha_emision_poliza_month, primas.prima_cancelada]
      filters:
        primas.fecha_emision_poliza_month: 24 months ago for 24 months
      sorts: [primas.fecha_emision_poliza_month desc]
      limit: 500
      dynamic_fields:
        - table_calculation: variacion
          label: Variación
          expression: "${primas.prima_cancelada} / offset(${primas.prima_cancelada}, 1) - 1"
          value_format_name: percent_1
          _kind_hint: measure
      custom_color_enabled: true
      custom_color: "#f0645a"
      show_single_value_title: true
      single_value_title: "Prima Cancelada (último mes)"
      show_comparison: true
      comparison_type: change
      comparison_label: "vs mes anterior"
      hidden_fields: [primas.fecha_emision_poliza_month]
      value_format: "$#,##0"
      listen:
        lob: producto.lob
      row: 1
      col: 14
      width: 5
      height: 3

    - name: kpi_polizas_canceladas
      title: "Pólizas canceladas"
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.count_polizas]
      filters:
        primas.tipo_transaccion: "CANC%"
      custom_color_enabled: true
      custom_color: "#f0645a"
      show_single_value_title: true
      single_value_title: "Pólizas Canceladas"
      value_format: "#,##0"
      listen:
        lob: producto.lob
      row: 1
      col: 19
      width: 5
      height: 3

    - name: col_altas_mes_entidad
      title: "¿Qué tan rápido crecemos en altas? (cuentas por mes y entidad, 24 meses)"
      model: actinver
      explore: clientes
      type: looker_column
      fields: [cuenta.fecha_apertura_month, cuenta.tipo_entidad_bancaria, cuenta.count]
      pivots: [cuenta.tipo_entidad_bancaria]
      filters:
        cuenta.fecha_apertura_month: 24 months ago for 24 months
      stacking: normal
      colors: ["#0f6ff5", "#12998a"]
      show_view_names: false
      show_value_labels: false
      x_axis_label: "Mes de Apertura"
      y_axis_combined: true
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 0
      width: 14
      height: 7

    - name: dona_clientes_por_estatus
      title: "Clientes por estatus (etapa)"
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [clientes.id_estatus_cliente, clientes.count]
      inner_radius: 55
      colors: ["#0f6ff5", "#12998a", "#3dbe7a", "#e3a33b", "#f0645a"]
      show_view_names: false
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 14
      width: 10
      height: 7

    - name: col_cohortes_escalon
      title: "Cohortes de apertura y su distribución por escalón"
      model: actinver
      explore: clientes
      type: looker_column
      fields:
        - cuenta.fecha_apertura_year
        - dt_escalera_vinculacion.escalon_vinculacion
        - dt_escalera_vinculacion.count
      pivots: [dt_escalera_vinculacion.escalon_vinculacion]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
        cuenta.fecha_apertura_year: "-NULL"
      stacking: percent
      colors: ["#8573e8", "#e3a33b", "#0f6ff5", "#12998a", "#3dbe7a"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "0.0%"
      x_axis_label: "Año de Apertura"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 11
      col: 0
      width: 14
      height: 7

    - name: dona_estatus_cuenta
      title: "Cuentas por estatus de operación"
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [cuenta.id_estatus_cuenta, cuenta.count]
      inner_radius: 50
      colors: ["#0f6ff5", "#3dbe7a", "#e3a33b", "#f0645a"]
      show_view_names: false
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 11
      col: 14
      width: 10
      height: 7

    - name: col_polizas_transaccion_mes
      title: "Emisión, renovación y cancelación de pólizas por mes"
      model: actinver
      explore: primas
      type: looker_column
      fields: [primas.fecha_emision_poliza_month, primas.tipo_transaccion, primas.count_polizas]
      pivots: [primas.tipo_transaccion]
      filters:
        primas.fecha_emision_poliza_month: 24 months ago for 24 months
      colors: ["#0f6ff5", "#12998a", "#f0645a"]
      show_view_names: false
      show_value_labels: false
      listen:
        lob: producto.lob
      row: 18
      col: 0
      width: 24
      height: 7

    - name: tabla_detalle_cohortes
      title: "Detalle de evolución por cohorte mensual (últimos 24 meses)"
      model: actinver
      explore: clientes
      type: looker_grid
      fields:
        - cuenta.fecha_apertura_month
        - cuenta.count
        - dt_escalera_vinculacion.count
        - dt_escalera_vinculacion.clientes_solo_eje
        - dt_escalera_vinculacion.clientes_multiproducto
        - dt_escalera_vinculacion.pct_multiproducto
      filters:
        cuenta.fecha_apertura_month: 24 months ago for 24 months
      sorts: [cuenta.fecha_apertura_month desc]
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
          fields: [dt_escalera_vinculacion.pct_multiproducto]
      series_labels:
        cuenta.fecha_apertura_month: Mes de Apertura
        cuenta.count: Total Cuentas
        dt_escalera_vinculacion.count: Clientes con Tenencia
        dt_escalera_vinculacion.clientes_solo_eje: Clientes Solo Eje
        dt_escalera_vinculacion.clientes_multiproducto: Multiproducto (2+)
        dt_escalera_vinculacion.pct_multiproducto: "% Multiproducto"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 25
      col: 0
      width: 24
      height: 8
