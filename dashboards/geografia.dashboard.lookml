- dashboard: geografia
  title: "Inteligencia Geográfica"
  description: "Distribución territorial de clientes y pólizas, sucursales georreferenciadas y concentración por estado."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: estado
      title: "Estado"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcentrofinanciero.estado_nombre

    - name: centro_financiero
      title: "Centro Financiero"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcentrofinanciero.centro_financiero

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Inteligencia Geográfica (Adaptado)</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Mapeo de cobertura y clientes utilizando el centro financiero como nodo de geolocalización. Estado derivado del prefijo del centro; división territorial oficial INEGI.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_total_estados
      title: "Entidades Federativas con Cobertura"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.estado_nombre]
      dynamic_fields:
        - table_calculation: total_estados
          label: "Total Estados"
          expression: "count(${catcentrofinanciero.estado_nombre})"
          value_format_name: decimal_0
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 0
      width: 8
      height: 3

    - name: kpi_centros_mapeados
      title: "Centros Financieros Mapeados"
      model: actinver
      explore: clientes
      type: single_value
      fields: [catcentrofinanciero.count]
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 8
      width: 8
      height: 3

    - name: kpi_clientes_territorio
      title: "Clientes en Red Territorial"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.count]
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 16
      width: 8
      height: 3

    - name: map_clientes_estado
      title: "¿Dónde están mis clientes y la cobertura? (Mapa Geográfico por Estado)"
      note_state: collapsed
      note_display: below
      note_text: "Concentración de clientes por entidad federativa mapeada."
      model: actinver
      explore: clientes
      type: looker_geo_choropleth
      fields: [catcentrofinanciero.estado_nombre, clientes.count]
      sorts: [clientes.count desc]
      limit: 50
      map: mexico_states
      map_layer_name: mexico_states
      map_value_colors: ["#9EC5FF", "#002D6F"]
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 6
      col: 0
      width: 15
      height: 10

    - name: chart_clientes_por_estado
      title: "Concentración de Clientes por Entidad Federativa"
      note_state: collapsed
      note_display: below
      note_text: "Ranking de volumen de clientes por estado derivado."
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [catcentrofinanciero.estado_nombre, clientes.count]
      sorts: [clientes.count desc]
      limit: 15
      series_colors:
        clientes.count: "#0853BB"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 6
      col: 15
      width: 9
      height: 10

    - name: table_crecimiento_por_zona
      title: "¿Qué zonas crecen y concentran clientes? (Desglose por Centro)"
      note_state: collapsed
      note_display: below
      note_text: "Clientes, productos promedio y pólizas vinculadas por centro financiero."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        catcentrofinanciero.estado_nombre,
        catcentrofinanciero.centro_financiero,
        clientes.count,
        dt_escalera_vinculacion.productos_promedio,
        dt_escalera_vinculacion.pct_solo_eje,
        clientes.clientes_con_seguro
      ]
      sorts: [clientes.count desc]
      limit: 60
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        estado: catcentrofinanciero.estado_nombre
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 16
      col: 0
      width: 16
      height: 8

    - name: info_fuentes_externas
      type: text
      body_text: "<div style='background:#F4F6F9; border:1px solid #D1D9E0; border-left:5px solid #002D6F; border-radius:8px; padding:18px; height:80%;'><h3 style='color:#002D6F; font-size:15px; margin:0 0 8px 0;'>📌 Notas de Validación Geográfica</h3><p style='color:#334155; font-size:12px; line-height:1.6; margin:0;'>• <b>ID_LOCALIDAD en Seguros:</b> Requiere tabla de correspondencia INEGI para mapeo municipal oficial.<br>• <b>Lugar de Nacimiento vs Residencia:</b> Se respeta la regla de exclusión de <code>persona.id_estado_nacimiento</code> para evitar falsas concentraciones residenciales.<br>• <b>Fuentes Externas Faltantes:</b> Población objetivo de CONAPO y distancias isócronas no disponibles sin capa geoespacial externa.</p></div>"
      row: 16
      col: 16
      width: 8
      height: 8
