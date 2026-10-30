- dashboard: calidad_datos
  title: "Transversal: Calidad de Datos y Gobierno"
  description: "Monitoreo de integridad de datos, reglas de consistencia técnica, completitud y gobierno de datos en Actinver."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: Severidad
      title: Severidad
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      model: actinver
      explore: calidad_datos
      field: calidad_datos.severidad

    - name: Tabla
      title: Tabla
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      model: actinver
      explore: calidad_datos
      field: calidad_datos.tabla

  elements:
    - name: nav_header
      type: text
      title_text: ""
      subtitle_text: ""
      body_text: "[Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Visión 360](/dashboards/actinver::vision_360) · [Geografía](/dashboards/actinver::geografia) · **Calidad de datos**"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: kpi_reglas_evaluadas
      title: "Reglas Evaluadas"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.total_reglas]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Total Reglas"
      value_format: "#,##0"
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 1
      col: 0
      width: 5
      height: 3

    - name: kpi_reglas_con_falla
      title: "Reglas con Observación"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.reglas_con_falla]
      custom_color_enabled: true
      custom_color: "#f0645a"
      show_single_value_title: true
      single_value_title: "Con Observación"
      value_format: "#,##0"
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 1
      col: 5
      width: 5
      height: 3

    - name: kpi_reglas_conformes
      title: "Reglas Conformes"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.reglas_sin_falla]
      custom_color_enabled: true
      custom_color: "#3dbe7a"
      show_single_value_title: true
      single_value_title: "100% Conformes"
      value_format: "#,##0"
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 1
      col: 10
      width: 4
      height: 3

    - name: kpi_pct_promedio_falla
      title: "% Promedio de Falla"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.pct_promedio_falla]
      custom_color_enabled: true
      custom_color: "#e3a33b"
      show_single_value_title: true
      single_value_title: "% Falla Promedio"
      value_format: "0.00%"
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 1
      col: 14
      width: 5
      height: 3

    - name: kpi_total_registros_falla
      title: "Total Registros con Falla"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.total_registros_con_falla]
      custom_color_enabled: true
      custom_color: "#8573e8"
      show_single_value_title: true
      single_value_title: "Registros Observados"
      value_format: "#,##0"
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 1
      col: 19
      width: 5
      height: 3

    - name: table_matriz_calidad
      title: "Matriz de Reglas de Calidad e Integridad de Datos (R1 a R9)"
      model: actinver
      explore: calidad_datos
      type: looker_grid
      fields: [
        calidad_datos.regla,
        calidad_datos.descripcion,
        calidad_datos.tabla,
        calidad_datos.severidad,
        calidad_datos.registros_evaluados,
        calidad_datos.registros_con_falla,
        calidad_datos.pct_falla,
        calidad_datos.accion
      ]
      sorts: [calidad_datos.regla asc]
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
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 4
      col: 0
      width: 24
      height: 9

    - name: chart_fallas_por_regla
      title: "¿Qué reglas acumulan mayor volumen de registros con observación?"
      model: actinver
      explore: calidad_datos
      type: looker_column
      fields: [calidad_datos.regla, calidad_datos.total_registros_con_falla]
      sorts: [calidad_datos.total_registros_con_falla desc]
      colors: ["#f0645a"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "#,##0"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 13
      col: 0
      width: 8
      height: 8

    - name: chart_reglas_por_severidad
      title: "Distribución de reglas por nivel de severidad"
      model: actinver
      explore: calidad_datos
      type: looker_pie
      fields: [calidad_datos.severidad, calidad_datos.total_reglas]
      sorts: [calidad_datos.total_reglas desc]
      colors: ["#f0645a", "#e3a33b", "#3dbe7a", "#0f6ff5"]
      show_view_names: false
      inner_radius: 50
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 13
      col: 8
      width: 8
      height: 8

    - name: chart_falla_por_tabla
      title: "% de falla promedio por tabla fuente"
      model: actinver
      explore: calidad_datos
      type: looker_bar
      fields: [calidad_datos.tabla, calidad_datos.pct_promedio_falla]
      sorts: [calidad_datos.pct_promedio_falla desc]
      colors: ["#0f6ff5"]
      show_view_names: false
      show_value_labels: true
      label_value_format: "0.00%"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        Severidad: calidad_datos.severidad
        Tabla: calidad_datos.tabla
      row: 13
      col: 16
      width: 8
      height: 8
