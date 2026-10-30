- dashboard: desempeno_sucursales
  title: "Desempeño de Sucursales — Portal Actinver"
  description: "Monitoreo territorial, ranking de centros financieros, concentración de cartera y oportunidad de vinculación por asesor."
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
      body_text: "[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · **Sucursales** · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos)"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 16px 24px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Desempeño de Sucursales y Centros Financieros</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Monitoreo territorial, ranking de centros financieros, concentración de cartera y oportunidad de vinculación por asesor.</p></div>"
      row: 1
      col: 0
      width: 24
      height: 2

    - name: kpi_total_centros
      title: "Centros financieros"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.count]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Total Centros"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 0
      width: 6
      height: 3

    - name: kpi_asesores_activos
      title: "Asesores activos"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catasesor.asesores_activos]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Asesores Activos"
      value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 6
      width: 6
      height: 3

    - name: kpi_clientes_por_centro
      title: "Clientes por centro"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count, catcentrofinanciero.count]
      dynamic_fields:
        - table_calculation: clientes_por_centro
          label: "Clientes por Centro"
          expression: "if(${catcentrofinanciero.count} > 0, ${dt_escalera_vinculacion.count} / ${catcentrofinanciero.count}, null)"
          value_format: "#,##0"
          _kind_hint: measure
      hidden_fields: [dt_escalera_vinculacion.count, catcentrofinanciero.count]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Clientes por Centro Promedio"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 12
      width: 6
      height: 3

    - name: kpi_pct_solo_eje
      title: "% Solo eje"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      custom_color_enabled: true
      custom_color: "#e3a33b"
      show_single_value_title: true
      single_value_title: "% Solo eje (Oportunidad)"
      value_format: "0.0%"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 1
      col: 18
      width: 6
      height: 3

    - name: mapa_sucursales_puntos
      title: "Mapa de sucursales: clientes y % solo eje"
      model: actinver
      explore: clientes
      type: looker_google_map
      fields:
        - catcentrofinanciero.centro_financiero
        - dt_centro_ubicacion.ubicacion
        - dt_escalera_vinculacion.count
        - dt_escalera_vinculacion.pct_solo_eje
      filters:
        dt_centro_ubicacion.ubicacion: "-NULL"
      map_plot_mode: points
      map_tile_provider: light
      map_position: fit
      map_scale_indicator: false
      map_pannable: true
      map_zoomable: true
      map_point_color: "#0f6ff5"
      map_marker_radius_min: 5
      map_marker_radius_max: 20
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 0
      width: 14
      height: 8

    - name: ranking_centros
      title: "Ranking de centros por clientes con tenencia"
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.count]
      sorts: [dt_escalera_vinculacion.count desc]
      limit: 15
      colors: ["#0f6ff5"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      y_axis_combined: true
      reference_lines:
        - reference_type: line
          line_value: mean
          range_end: max
          range_start: min
          margin_top: deviation
          margin_value: mean
          margin_bottom: deviation
          label_position: right
          color: "#f0645a"
          label: "Promedio red"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 4
      col: 14
      width: 10
      height: 8

    - name: tabla_oportunidad_vinculacion
      title: "¿Qué centros tienen más oportunidad de vinculación?"
      model: actinver
      explore: clientes
      type: looker_grid
      fields:
        - catcentrofinanciero.centro_financiero
        - catcentrofinanciero.estado_nombre
        - dt_escalera_vinculacion.count
        - dt_escalera_vinculacion.clientes_solo_eje
        - dt_escalera_vinculacion.pct_solo_eje
        - dt_escalera_vinculacion.productos_promedio
      sorts: [dt_escalera_vinculacion.pct_solo_eje desc]
      limit: 50
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
          fields: [dt_escalera_vinculacion.pct_solo_eje]
      series_labels:
        catcentrofinanciero.centro_financiero: Centro Financiero
        catcentrofinanciero.estado_nombre: Estado
        dt_escalera_vinculacion.count: Total Clientes
        dt_escalera_vinculacion.clientes_solo_eje: Clientes Solo Eje
        dt_escalera_vinculacion.pct_solo_eje: "% Solo Eje"
        dt_escalera_vinculacion.productos_promedio: Productos Promedio
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 12
      col: 0
      width: 24
      height: 8

    - name: col_apertura_evolucion_escalon
      title: "¿La apertura de cuentas crece y cambia la vinculación?"
      model: actinver
      explore: clientes
      type: looker_column
      fields:
        - cuenta.fecha_apertura_month
        - dt_escalera_vinculacion.escalon_vinculacion
        - dt_escalera_vinculacion.count
      pivots: [dt_escalera_vinculacion.escalon_vinculacion]
      filters:
        cuenta.fecha_apertura_month: 24 months ago for 24 months
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      stacking: normal
      colors: ["#8573e8", "#e3a33b", "#0f6ff5", "#12998a", "#3dbe7a"]
      show_view_names: false
      show_value_labels: false
      x_axis_label: "Mes de Apertura"
      y_axis_combined: true
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 20
      col: 0
      width: 14
      height: 7

    - name: bar_asesores_clientes_sin_vincular
      title: "¿Cuántos clientes sin vincular tiene cada asesor?"
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catasesor.asesor_etiqueta, dt_escalera_vinculacion.clientes_solo_eje]
      sorts: [dt_escalera_vinculacion.clientes_solo_eje desc]
      limit: 15
      colors: ["#e3a33b"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      listen:
        Estado: catcentrofinanciero.estado_nombre
        Centro financiero: catcentrofinanciero.centro_financiero
        Escalón: dt_escalera_vinculacion.escalon_vinculacion
        Entidad: cuenta.tipo_entidad_bancaria
        Tipo de persona: clientes.tipo_persona_desc
      row: 20
      col: 14
      width: 10
      height: 7

    - name: bar_clientes_por_estado
      title: "Clientes por estado"
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.estado_nombre, dt_escalera_vinculacion.count]
      sorts: [dt_escalera_vinculacion.count desc]
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
      row: 27
      col: 0
      width: 24
      height: 7
