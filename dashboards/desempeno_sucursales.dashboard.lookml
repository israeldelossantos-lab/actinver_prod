- dashboard: desempeno_sucursales
  title: "Desempeño de Sucursales y Centros Financieros"
  description: "Monitoreo de vinculación territorial, productividad de asesores y canal digital en Actinver."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: centro_financiero
      title: "Centro Financiero"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcentrofinanciero.centro_financiero

    - name: estado
      title: "Estado"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcentrofinanciero.estado_nombre

    - name: canal_originacion
      title: "Canal de Originación"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcanaloriginacion.canal_originacion

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Desempeño de Sucursales</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Evaluación de penetración y oportunidad de vinculación por centro financiero. [VALIDAR] Estado derivado del prefijo del centro financiero; mapa integrado con dim_sucursales. Sustituye AUM: no hay saldos en la fuente.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_centros_activos
      title: "Centros Financieros"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.count]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_asesores_activos
      title: "Asesores Activos"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catasesor.asesores_activos]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_clientes_por_centro
      title: "Clientes Promedio por Centro"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.count, catcentrofinanciero.count]
      dynamic_fields:
        - table_calculation: clientes_por_centro
          label: "Promedio Clientes/Centro"
          expression: "${clientes.count} / nullif(${catcentrofinanciero.count}, 0)"
          value_format_name: decimal_0
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_solo_eje_red
      title: "% Solo Eje Red"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 3
      col: 18
      width: 6
      height: 3

    - name: table_ranking_centros
      title: "¿Qué centros tienen más oportunidad de vinculación?"
      note_state: collapsed
      note_display: below
      note_text: "Ranking de centros por volumen de clientes, % solo eje y productos promedio."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        catcentrofinanciero.centro_financiero,
        catcentrofinanciero.estado_nombre,
        clientes.count,
        dt_escalera_vinculacion.pct_solo_eje,
        dt_escalera_vinculacion.productos_promedio
      ]
      sorts: [clientes.count desc]
      limit: 60
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 6
      col: 0
      width: 14
      height: 9

    - name: chart_centros_vs_promedio
      title: "¿Qué centros están por arriba o por debajo del promedio?"
      note_state: collapsed
      note_display: below
      note_text: "Diferencia en productos promedio respecto a la media de la red."
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.centro_financiero, dt_escalera_vinculacion.productos_promedio]
      sorts: [dt_escalera_vinculacion.productos_promedio desc]
      limit: 25
      series_colors:
        dt_escalera_vinculacion.productos_promedio: "#0853BB"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 6
      col: 14
      width: 10
      height: 9

    - name: chart_aperturas_canal
      title: "¿La apertura digital crece y cambia la vinculación?"
      note_state: collapsed
      note_display: below
      note_text: "Evolución mensual de apertura de cuentas por canal."
      model: actinver
      explore: clientes
      type: looker_column
      fields: [cuenta.fecha_apertura_month, catcanaloriginacion.canal_originacion, cuenta.count]
      pivots: [catcanaloriginacion.canal_originacion]
      sorts: [cuenta.fecha_apertura_month asc]
      stacking: normal
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 15
      col: 0
      width: 14
      height: 8

    - name: chart_carga_por_asesor
      title: "¿Cuántos clientes sin vincular tiene cada asesor?"
      note_state: collapsed
      note_display: below
      note_text: "Carga de clientes totales vs clientes solo eje por asesor activo."
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catasesor.asesor_etiqueta, clientes.count, dt_escalera_vinculacion.clientes_solo_eje]
      sorts: [clientes.count desc]
      limit: 30
      series_colors:
        clientes.count: "#0F6FF5"
        dt_escalera_vinculacion.clientes_solo_eje: "#F0645A"
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 15
      col: 14
      width: 10
      height: 8

    - name: map_sucursales_estado
      title: "¿Dónde está la oportunidad en el país? (Distribución Territorial)"
      note_state: collapsed
      note_display: below
      note_text: "Clientes y sucursales georreferenciadas."
      model: actinver
      explore: clientes
      type: looker_map
      fields: [dim_sucursales.ubicacion, dim_sucursales.sucursal_nombre, clientes.count]
      sorts: [clientes.count desc]
      limit: 50
      map_plot_mode: points
      map_marker_type: circle
      map_marker_radius_mode: proportional_value
      map_marker_radius_min: 5
      map_marker_radius_max: 20
      map_value_colors: ["#9EC5FF", "#002D6F"]
      map_latitude: 23.6345
      map_longitude: -102.5528
      map_zoom: 5
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        estado: catcentrofinanciero.estado_nombre
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 23
      col: 0
      width: 18
      height: 9

    - name: alerta_info_tile
      type: text
      body_text: "<div style='background:#FFF9E6; border:1px solid #FFE082; border-left:5px solid #FFB300; border-radius:8px; padding:18px;'><h3 style='color:#7A5200; font-size:16px; margin:0 0 8px 0;'>🔔 Alerta de Vinculación Configurada</h3><p style='color:#8C6200; font-size:13px; margin:0 0 10px 0;'><b>Condición:</b> % Solo Eje del centro financiero > Promedio de la Red (umbral 20%).<br><b>Frecuencia:</b> Semanal (Lunes 8:00 AM).<br><b>Propósito:</b> Notificar oportunidades críticas de escalamiento de portafolio sin destinatarios reales en entorno QA.</p></div>"
      row: 23
      col: 18
      width: 6
      height: 9
