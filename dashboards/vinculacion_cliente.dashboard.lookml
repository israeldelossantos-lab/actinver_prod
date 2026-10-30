- dashboard: vinculacion_cliente
  title: "Vinculación del Cliente"
  description: "Monitoreo de la escalera de tenencia, venta cruzada y afinidad de productos de inversión en Actinver."
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

    - name: asesor
      title: "Asesor"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catasesor.asesor_etiqueta

    - name: canal_originacion
      title: "Canal de Originación"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcanaloriginacion.canal_originacion

    - name: escalon
      title: "Escalón Vinculación"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: dt_escalera_vinculacion.escalon_vinculacion

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Vinculación del Cliente</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Análisis de tenencia y diversificación de productos válidos (16 productos de inversión). [VALIDAR] Sustituye AUM: no hay saldos en la fuente. Los perfiles K-means corresponden a fase S6–S7.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_total_clientes
      title: "Clientes con Portafolio"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.count]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_pct_solo_eje
      title: "% Clientes Solo Eje"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_solo_eje]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_productos_promedio
      title: "Productos Promedio (Válidos)"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.productos_promedio]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_multiproducto
      title: "Clientes Multiproducto (2+)"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_multiproducto]
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 3
      col: 18
      width: 6
      height: 3

    - name: chart_escalera_vinculacion
      title: "¿Dónde se atora la vinculación de nuestros clientes?"
      note_state: collapsed
      note_display: below
      note_text: "Distribución de clientes por escalón en la escalera de productos."
      model: actinver
      explore: clientes
      type: looker_column
      fields: [dt_escalera_vinculacion.escalon_vinculacion, dt_escalera_vinculacion.count]
      sorts: [dt_escalera_vinculacion.count desc]
      series_colors:
        dt_escalera_vinculacion.count: "#0F6FF5"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 6
      col: 0
      width: 12
      height: 8

    - name: chart_penetracion_productos
      title: "¿Qué productos tienen nuestros clientes?"
      note_state: collapsed
      note_display: below
      note_text: "Penetración de los principales productos de inversión."
      model: actinver
      explore: clientes
      type: looker_bar
      fields: [
        cliente_producto_09_10_2026.penetracion_fondos_deuda,
        cliente_producto_09_10_2026.penetracion_reporto,
        cliente_producto_09_10_2026.penetracion_renta_variable,
        cliente_producto_09_10_2026.penetracion_prlv
      ]
      series_colors:
        cliente_producto_09_10_2026.penetracion_fondos_deuda: "#0853BB"
        cliente_producto_09_10_2026.penetracion_reporto: "#0F6FF5"
        cliente_producto_09_10_2026.penetracion_renta_variable: "#3DBE7A"
        cliente_producto_09_10_2026.penetracion_prlv: "#E3A33B"
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 6
      col: 12
      width: 12
      height: 8

    - name: chart_afinidad_heatmap
      title: "¿Qué productos van juntos y a cuántos clientes se les puede ofrecer?"
      note_state: collapsed
      note_display: below
      note_text: "Matriz de afinidad cruzada (Lift y confianza entre pares de productos)."
      model: actinver
      explore: afinidad_productos
      type: looker_grid
      fields: [
        afinidad_productos.producto_origen,
        afinidad_productos.producto_destino,
        afinidad_productos.clientes_con_ambos,
        afinidad_productos.confianza_pct,
        afinidad_productos.lift
      ]
      sorts: [afinidad_productos.lift desc]
      limit: 50
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      row: 14
      col: 0
      width: 14
      height: 8

    - name: chart_eje_mas_uno_canal
      title: "¿Con qué producto dan el primer paso según el canal de originación?"
      note_state: collapsed
      note_display: below
      note_text: "Distribución de clientes Eje + 1 por canal."
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [catcanaloriginacion.canal_originacion, dt_escalera_vinculacion.count]
      filters:
        dt_escalera_vinculacion.escalon_vinculacion: "Eje + 1"
      sorts: [dt_escalera_vinculacion.count desc]
      inner_radius: 50
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
      row: 14
      col: 14
      width: 10
      height: 8

    - name: table_siguiente_producto
      title: "¿Qué le ofrezco a cada cliente y por qué? (Lista Accionable)"
      note_state: collapsed
      note_display: below
      note_text: "Recomendación personalizada de cross-sell por cliente y escalón."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        clientes.cliente_ref,
        dt_escalera_vinculacion.escalon_vinculacion,
        dt_siguiente_producto_sugerido.siguiente_producto_sugerido,
        dt_siguiente_producto_sugerido.pct_grupo_que_lo_tiene,
        dt_siguiente_producto_sugerido.lift_estimado,
        dt_siguiente_producto_sugerido.razon_recomendacion,
        catcentrofinanciero.centro_financiero
      ]
      sorts: [dt_siguiente_producto_sugerido.lift_estimado desc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        centro_financiero: catcentrofinanciero.centro_financiero
        asesor: catasesor.asesor_etiqueta
        canal_originacion: catcanaloriginacion.canal_originacion
        escalon: dt_escalera_vinculacion.escalon_vinculacion
      row: 22
      col: 0
      width: 18
      height: 8

    - name: placeholder_kmeans
      type: text
      body_text: "<div style='background:#F4F6F9; border:2px dashed #B8C2CC; border-radius:10px; padding:25px; height:100%; display:flex; flex-direction:column; justify-content:center; align-items:center; text-align:center;'><h3 style='color:#556575; font-size:18px; margin:0 0 10px 0;'>Perfiles K-Means de Inversionistas</h3><p style='color:#778595; font-size:13px; margin:0;'>¿Qué tipos de cliente hay y qué le falta a cada uno?<br><br><b>Estado: Pendiente S6–S7</b><br>Segmentación no supervisada en desarrollo sobre 16 componentes de portafolio.</p></div>"
      row: 22
      col: 18
      width: 6
      height: 8
