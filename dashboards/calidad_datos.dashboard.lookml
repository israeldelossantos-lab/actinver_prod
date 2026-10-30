- dashboard: calidad_datos
  title: "Transversal: Calidad de Datos y Gobierno"
  description: "Monitoreo de integridad de datos, reglas de consistencia técnica, gobierno PII y estado de analítica conversacional."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: severidad
      title: "Severidad de Regla"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: calidad_datos
      field: calidad_datos.severidad

    - name: tabla
      title: "Tabla de Origen"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: calidad_datos
      field: calidad_datos.tabla

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Transversal (Calidad de Datos, Seguridad y Observabilidad)</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Matriz de reglas de integridad sintética y productiva, control de acceso a datos confidenciales (PII) y habilitación de gobierno de datos en Actinver.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_reglas_evaluadas
      title: "Reglas Evaluadas"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.total_reglas]
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_reglas_con_falla
      title: "Reglas con Observación"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.reglas_con_falla]
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_reglas_conformes
      title: "Reglas Conformes"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.reglas_sin_falla]
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_pct_promedio_falla
      title: "% Promedio de Falla"
      model: actinver
      explore: calidad_datos
      type: single_value
      fields: [calidad_datos.pct_promedio_falla]
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 3
      col: 18
      width: 6
      height: 3

    - name: table_matriz_calidad
      title: "Matriz de Reglas de Calidad e Integridad de Datos (R1 a R9)"
      note_state: collapsed
      note_display: below
      note_text: "Se exponen, no se corrigen. Reglas técnicas de integridad referencial, duplicidad y consistencia temporal."
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
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 6
      col: 0
      width: 24
      height: 9

    - name: chart_fallas_por_regla
      title: "Registros con Falla / Observación por Regla"
      note_state: collapsed
      note_display: below
      note_text: "Volumen de registros que incumplen el criterio de integridad definido."
      model: actinver
      explore: calidad_datos
      type: looker_column
      fields: [calidad_datos.regla, calidad_datos.total_registros_con_falla]
      sorts: [calidad_datos.total_registros_con_falla desc]
      series_colors:
        calidad_datos.total_registros_con_falla: "#E53935"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        severidad: calidad_datos.severidad
        tabla: calidad_datos.tabla
      row: 15
      col: 0
      width: 12
      height: 8

    - name: tile_seguridad_pii
      type: text
      body_text: "<div style='background: #F4F6F9; border: 1px solid #D1D9E0; border-left: 5px solid #002D6F; border-radius: 8px; padding: 18px; height: 85%;'><h3 style='color: #002D6F; font-size: 16px; margin: 0 0 10px 0;'>🔒 Seguridad y Control de Acceso (CLS / PII)</h3><p style='color: #334155; font-size: 13px; line-height: 1.6; margin: 0;'><b>Política de Anonimización:</b> Se implementó control de acceso a nivel columna (CLS) mediante <code>access_grant: ver_pii</code> con el atributo de usuario <code>ver_pii = 'si'</code>.<br><br><b>Campos Protegidos:</b><br>• <code>cliente_producto.customer_id</code><br>• <code>cuenta.cuenta_flex</code><br>• <code>cliente.id_persona, id_asesor, rfc_curp</code><br>• <code>polizas.poliza_ref</code> (máscara pública <code>***1234</code>)<br><br><b>Estado Actual:</b> User attribute <code>ver_pii</code> pendiente de configuración formal en Looker Admin Console para usuarios no administradores.</p></div>"
      row: 15
      col: 12
      width: 6
      height: 8

    - name: tile_conversational_analytics
      type: text
      body_text: "<div style='background: #FFFBEB; border: 1px solid #FCD34D; border-left: 5px solid #D97706; border-radius: 8px; padding: 18px; height: 85%;'><h3 style='color: #92400E; font-size: 16px; margin: 0 0 10px 0;'>💬 Conversational Analytics (GenAI)</h3><p style='color: #78350F; font-size: 13px; line-height: 1.6; margin: 0;'><b>Alcance y Estatus:</b> Iniciativa fuera del alcance del modelado relacional LookML tradicional (requiere integración con Looker GenAI Data Agent / BigQuery Data Agent).<br><br><b>Metas de Aprobación:</b><br>• Suite de <i>Golden Queries</i> por perfil comercial (Directivo, Asesor Patrimonial, Analista de Riesgo).<br>• Meta de precisión y grounding semántico: <b>≥ 80 % de éxito</b> sin alucinación.<br><br><b>Acción:</b> Pendiente de habilitación en capa de agentes conversacionales.</p></div>"
      row: 15
      col: 18
      width: 6
      height: 8
