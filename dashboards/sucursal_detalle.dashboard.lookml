- dashboard: sucursal_detalle
  title: "Detalle de Sucursal: Clientes y Oportunidad"
  description: "Drill de clientes por centro financiero: escalón de vinculación, tenencia de productos, seguros y productos sugeridos."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: Centro financiero
      title: Centro financiero
      type: field_filter
      default_value: "JAL GUADALAJARA AV AMERICA"
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
      title_text: ""
      subtitle_text: ""
      body_text: "[← Volver a Sucursales](/dashboards/actinver::desempeno_sucursales) · [Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos)"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: kpi_clientes_sucursal
      title: "Clientes con Tenencia"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Total Clientes"
      value_format: "#,##0"
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 1
      col: 0
      width: 6
      height: 3

    - name: kpi_pct_solo_eje
      title: "% Solo Eje"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      custom_color_enabled: true
      custom_color: "#e3a33b"
      show_single_value_title: true
      single_value_title: "% Oportunidad Solo Eje"
      value_format: "0.0%"
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 1
      col: 6
      width: 6
      height: 3

    - name: kpi_productos_promedio
      title: "Productos Promedio"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.productos_promedio]
      custom_color_enabled: true
      custom_color: "#3dbe7a"
      show_single_value_title: true
      single_value_title: "Productos / Cliente"
      value_format: "0.00"
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 1
      col: 12
      width: 6
      height: 3

    - name: kpi_pct_con_seguro
      title: "% con Seguro"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
      dynamic_fields:
        - table_calculation: pct_seguro
          label: "% con Seguro"
          expression: "${clientes.clientes_con_seguro} / ${dt_escalera_vinculacion.count}"
          value_format_name: percent_1
      hidden_fields: [clientes.clientes_con_seguro, dt_escalera_vinculacion.count]
      custom_color_enabled: true
      custom_color: "#8573e8"
      show_single_value_title: true
      single_value_title: "Penetración de Seguros"
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 1
      col: 18
      width: 6
      height: 3

    - name: chart_distribucion_escalon
      title: "Distribución de clientes por escalón de vinculación en la sucursal"
      model: actinver
      explore: clientes
      type: looker_column
      fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      sorts: [dt_escalera_vinculacion.escalon_vinculacion asc]
      colors: ["#0f6ff5"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 4
      col: 0
      width: 24
      height: 6

    - name: table_clientes_sucursal
      title: "Clientes de la sucursal: portafolio y siguiente mejor producto"
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        clientes.foto,
        clientes.id_cliente_num,
        clientes.tipo_persona_desc,
        dt_escalera_vinculacion.escalon_vinculacion,
        dt_escalera_vinculacion.total_productos_validos,
        clientes.cliente_seguro,
        clientes.segmento_awm,
        clientes.fecha_alta_date,
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido
      ]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "-NULL"
      sorts: [dt_escalera_vinculacion.total_productos_validos desc]
      limit: 200
      show_view_names: false
      show_row_numbers: true
      table_theme: white
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
      listen:
        Centro financiero: catcentrofinanciero.centro_financiero
      row: 10
      col: 0
      width: 24
      height: 12
