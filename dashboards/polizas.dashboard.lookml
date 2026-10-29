- dashboard: polizas
  title: "Pólizas y Seguros"
  description: "Monitoreo de puntualidad de cobranza, domiciliación, vencimientos de cartera y emisión de primas."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: producto
      title: "Producto de Seguros"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: primas
      field: producto.producto

    - name: lob
      title: "Línea de Negocio (LOB)"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: primas
      field: producto.lob

    - name: rango_pago
      title: "Rango de Puntualidad"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: primas
      field: dt_desviacion_pago.rango_desviacion_pago

  elements:
    - name: header_tile
      type: text
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Pólizas y Cobranza de Seguros</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Seguimiento a cobranza a tiempo, impacto de domiciliación, vencimientos y nuevo negocio vs renovaciones. [VALIDAR] POLIZAS cuenta con COUNT DISTINCT por riesgo contable; cancelaciones negativas sumadas a prima neta.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_prima_neta
      title: "Prima Neta Emitida (2026)"
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.prima_neta_emitida]
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_polizas_emitidas
      title: "Pólizas Únicas Emitidas"
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.count_polizas]
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_pct_a_tiempo
      title: "% Cobranza a Tiempo (Gracia/Anticipada)"
      model: actinver
      explore: primas
      type: single_value
      fields: [dt_desviacion_pago.pct_recibos_a_tiempo]
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_desviacion_promedio
      title: "Desviación Promedio (Días)"
      model: actinver
      explore: primas
      type: single_value
      fields: [dt_desviacion_pago.desviacion_promedio_dias]
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 3
      col: 18
      width: 6
      height: 3

    - name: chart_puntualidad_pago
      title: "¿Qué cobramos a tiempo? (Distribución de Recibos por Rango)"
      note_state: collapsed
      note_display: below
      note_text: "Porcentaje de recibos por rango de atraso."
      model: actinver
      explore: primas
      type: looker_pie
      fields: [dt_desviacion_pago.rango_desviacion_pago, dt_desviacion_pago.total_recibos]
      sorts: [dt_desviacion_pago.rango_desviacion_pago asc]
      inner_radius: 50
      series_colors:
        1. Anticipado (< 0 d): "#0853BB"
        2. Gracia (0-15 d): "#3DBE7A"
        3. Atrasado (16-30 d): "#E3A33B"
        4. Crítico (> 30 d): "#F0645A"
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 6
      col: 0
      width: 12
      height: 8

    - name: chart_domiciliacion_desviacion
      title: "¿Las pólizas domiciliadas pagan con menos atraso?"
      note_state: collapsed
      note_display: below
      note_text: "Desviación promedio en días según estatus de domiciliación."
      model: actinver
      explore: primas
      type: looker_column
      fields: [domiciliado.es_domiciliada, dt_desviacion_pago.desviacion_promedio_dias]
      series_colors:
        dt_desviacion_pago.desviacion_promedio_dias: "#0F6FF5"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 6
      col: 12
      width: 12
      height: 8

    - name: chart_atraso_por_producto
      title: "¿Dónde se concentra el atraso? (Desviación y Morosidad por Producto)"
      note_state: collapsed
      note_display: below
      note_text: "Líneas de negocio con mayor proporción de recibos críticos."
      model: actinver
      explore: primas
      type: looker_bar
      fields: [producto.lob, dt_desviacion_pago.desviacion_promedio_dias, dt_desviacion_pago.pct_recibos_criticos]
      sorts: [dt_desviacion_pago.pct_recibos_criticos desc]
      limit: 15
      series_colors:
        dt_desviacion_pago.desviacion_promedio_dias: "#0853BB"
        dt_desviacion_pago.pct_recibos_criticos: "#F0645A"
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 14
      col: 0
      width: 12
      height: 8

    - name: chart_emision_mensual_lob
      title: "¿Cuánto emitimos en 2026? (Prima Emitida Mensual por LOB)"
      note_state: collapsed
      note_display: below
      note_text: "Evolución mensual de prima neta emitida por línea de negocio."
      model: actinver
      explore: primas
      type: looker_column
      fields: [primas.fecha_emision_poliza_month, producto.lob, primas.prima_neta_emitida]
      pivots: [producto.lob]
      sorts: [primas.fecha_emision_poliza_month asc]
      stacking: normal
      x_axis_gridlines: false
      y_axis_gridlines: true
      listen:
        producto: producto.producto
        lob: producto.lob
        rango_pago: dt_desviacion_pago.rango_desviacion_pago
      row: 14
      col: 12
      width: 12
      height: 8

    - name: table_vencimientos_cartera
      title: "¿Qué pólizas vencen pronto y cuánta prima podríamos perder?"
      note_state: collapsed
      note_display: below
      note_text: "Pólizas con vencimiento a 30, 60 y 90 días con prima en riesgo."
      model: actinver
      explore: polizas
      type: looker_grid
      fields: [
        dt_vencimientos_seguros.ventana_vencimiento,
        producto.producto,
        polizas.count_polizas,
        dt_vencimientos_seguros.prima_renovable_total
      ]
      filters:
        dt_vencimientos_seguros.es_por_vencer_90d: "yes"
      sorts: [dt_vencimientos_seguros.prima_renovable_total desc]
      limit: 50
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      row: 22
      col: 0
      width: 12
      height: 8

    - name: table_no_domiciliadas_atraso
      title: "¿A quién le ofrecemos domiciliar? (No Domiciliadas con Atraso Crítico)"
      note_state: collapsed
      note_display: below
      note_text: "Lista de pólizas con más de 30 días de atraso sin domiciliación bancaria."
      model: actinver
      explore: primas
      type: looker_grid
      fields: [
        primas.poliza,
        producto.producto,
        catasesor.asesor_etiqueta,
        dt_desviacion_pago.dias_desviacion,
        dt_desviacion_pago.monto_prima_pagada
      ]
      filters:
        domiciliado.es_domiciliada: "no"
        dt_desviacion_pago.es_critico: "yes"
      sorts: [dt_desviacion_pago.dias_desviacion desc]
      limit: 100
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        producto: producto.producto
        lob: producto.lob
      row: 22
      col: 12
      width: 12
      height: 8
