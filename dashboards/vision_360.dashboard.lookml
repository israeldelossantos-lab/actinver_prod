- dashboard: vision_360
  title: "Visión 360 del Cliente"
  description: "Segmentación integral, expediente KYC, venta cruzada inversiones-seguros y ficha individual de cliente."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: cliente_id
      title: "Buscar ID Cliente (Ficha 360)"
      type: field_filter
      default_value: ""
      allow_multiple_values: false
      required: false
      model: actinver
      explore: clientes
      field: clientes.id_cliente_num

    - name: asesor
      title: "Asesor"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catasesor.asesor_etiqueta

    - name: centro_financiero
      title: "Centro Financiero"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcentrofinanciero.centro_financiero

    - name: entidad_bancaria
      title: "Banco vs Casa de Bolsa"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: cuenta.tipo_entidad_bancaria

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Visión 360 del Cliente (Adaptado)</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Perfil integral de tenencia de inversión, expediente KYC, cruce con pólizas de seguros y concentración por asesor. [VALIDAR] Cruce seguros ↔ clientes vía ID_NUMERO_RELACION (~70% emparejamiento). Sin metas de asesor por ausencia de fuente.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_clientes_totales
      title: "Total Clientes"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.count]
      listen:
        cliente_id: clientes.id_cliente_num
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_awm_patrimonial
      title: "Clientes AWM Patrimonial"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.clientes_patrimoniales_awm]
      listen:
        cliente_id: clientes.id_cliente_num
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_cumplimiento_kyc
      title: "% Cumplimiento Biométrico KYC"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.pct_cumplimiento_biometrico]
      listen:
        cliente_id: clientes.id_cliente_num
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_venta_cruzada
      title: "Pólizas Ligadas a Clientes Inversión"
      model: actinver
      explore: clientes
      type: single_value
      fields: [polizas.count_polizas]
      listen:
        cliente_id: clientes.id_cliente_num
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 3
      col: 18
      width: 6
      height: 3

    - name: chart_segmentacion_cartera
      title: "¿Quiénes son mis clientes del segmento? (Banca vs Casa de Bolsa y Tipo Persona)"
      note_state: collapsed
      note_display: below
      note_text: "Distribución por entidad financiera y tipo de persona."
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [cuenta.tipo_entidad_bancaria, clientes.count]
      sorts: [clientes.count desc]
      inner_radius: 50
      series_colors:
        Banco: "#0F6FF5"
        Casa de Bolsa: "#0853BB"
        Otra Entidad: "#5B6678"
      listen:
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 6
      col: 0
      width: 12
      height: 8

    - name: chart_venta_cruzada_cruce
      title: "¿Qué producto le falta a cada cliente y cuánto potencial hay? (Venta Cruzada)"
      note_state: collapsed
      note_display: below
      note_text: "Tenencia de productos de inversión cruzada con seguros [VALIDAR]."
      model: actinver
      explore: clientes
      type: looker_column
      fields: [dt_escalera_vinculacion.escalon_vinculacion, polizas.count_polizas]
      sorts: [polizas.count_polizas desc]
      series_colors:
        polizas.count_polizas: "#0F6FF5"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 6
      col: 12
      width: 12
      height: 8

    - name: table_ficha_cliente_360
      title: "¿Cuál es la situación completa de este cliente hoy? (Ficha 360 Detallada)"
      note_state: collapsed
      note_display: below
      note_text: "Expediente KYC, escalón de vinculación, asesor asignado y seguros contratados."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        clientes.id_cliente_num,
        clientes.tipo_persona_desc,
        clientes.segmento_awm,
        dt_escalera_vinculacion.escalon_vinculacion,
        dt_escalera_vinculacion.total_productos_validos,
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido,
        clientes.biometrico_facial,
        clientes.carta_manifiesto,
        clientes.fiel_vigente,
        catasesor.asesor_etiqueta,
        catcentrofinanciero.centro_financiero,
        polizas.count_polizas
      ]
      sorts: [clientes.id_cliente_num asc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        cliente_id: clientes.id_cliente_num
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 14
      col: 0
      width: 24
      height: 8

    - name: table_cartera_asesores
      title: "¿Cómo está la cartera de cada asesor? (Clientes y Diversificación sin Metas)"
      note_state: collapsed
      note_display: below
      note_text: "Cartera administrada por asesor comercial en inversiones y seguros."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        catasesor.asesor_etiqueta,
        catasesor.grupo,
        catcentrofinanciero.centro_financiero,
        clientes.count,
        dt_escalera_vinculacion.productos_promedio,
        dt_escalera_vinculacion.pct_solo_eje,
        polizas.count_polizas
      ]
      sorts: [clientes.count desc]
      limit: 50
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        asesor: catasesor.asesor_etiqueta
        centro_financiero: catcentrofinanciero.centro_financiero
        entidad_bancaria: cuenta.tipo_entidad_bancaria
      row: 22
      col: 0
      width: 24
      height: 8
