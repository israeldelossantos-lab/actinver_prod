- dashboard: ciclo_vida
  title: "Ciclo de Vida del Cliente"
  description: "Evolución de altas, estatus de cuentas, cohortes de vinculación y bajas en Actinver."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: canal_originacion
      title: "Canal de Originación"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: actinver
      explore: clientes
      field: catcanaloriginacion.canal_originacion

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
      body_text: "<div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'><h2 style='color: #FFFFFF; font-size: 22px; font-weight: 700; margin: 0 0 6px 0;'>Iniciativa: Ciclo de Vida del Cliente (Adaptado)</h2><p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.5; opacity: 0.85;'>Seguimiento al ritmo de altas, estatus de clientes y cohortes de maduración. [VALIDAR catálogo] Estatus de cliente y cuenta pendientes de catálogo formal. Indicadores de AUM, días a fondeo y flujo neto marcados como no disponibles por ausencia de saldos/movimientos.</p></div>"
      row: 0
      col: 0
      width: 24
      height: 3

    - name: kpi_total_clientes
      title: "Total Clientes Registrados"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.count]
      listen:
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 0
      width: 6
      height: 3

    - name: kpi_cuentas_totales
      title: "Total Contratos / Cuentas"
      model: actinver
      explore: clientes
      type: single_value
      fields: [cuenta.count]
      listen:
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 6
      width: 6
      height: 3

    - name: kpi_polizas_emitidas
      title: "Pólizas Canceladas (Bajas Seguros)"
      model: actinver
      explore: primas
      type: single_value
      fields: [primas.prima_cancelada]
      row: 3
      col: 12
      width: 6
      height: 3

    - name: kpi_vinculacion_inicial
      title: "% Clientes Vinculados (Eje+1 o más)"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.pct_multiproducto]
      listen:
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 3
      col: 18
      width: 6
      height: 3

    - name: chart_altas_mensuales
      title: "¿Qué tan rápido convertimos y crecemos en altas? (Altas por Mes y Canal)"
      note_state: collapsed
      note_display: below
      note_text: "Nuevas cuentas aperturadas por mes según canal de originación."
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
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 6
      col: 0
      width: 14
      height: 8

    - name: chart_estatus_clientes
      title: "¿Cuántos clientes hay en cada etapa y dónde se atoran? (Estatus de Cliente)"
      note_state: collapsed
      note_display: below
      note_text: "Distribución por estatus de cliente [VALIDAR catálogo]."
      model: actinver
      explore: clientes
      type: looker_pie
      fields: [clientes.id_estatus_cliente, clientes.count]
      sorts: [clientes.count desc]
      inner_radius: 50
      series_colors:
        1: "#0F6FF5"
        2: "#0853BB"
        3: "#E3A33B"
      listen:
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 6
      col: 14
      width: 10
      height: 8

    - name: chart_cohortes_maduracion
      title: "¿Las generaciones recientes se retienen y crecen mejor? (Cohortes de Vinculación)"
      note_state: collapsed
      note_display: below
      note_text: "Mes de alta de la cuenta cruzado contra el escalón de vinculación actual."
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [cuenta.fecha_apertura_month, dt_escalera_vinculacion.escalon_vinculacion, clientes.count]
      pivots: [dt_escalera_vinculacion.escalon_vinculacion]
      sorts: [cuenta.fecha_apertura_month desc]
      limit: 50
      show_view_names: false
      show_row_numbers: false
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        canal_originacion: catcanaloriginacion.canal_originacion
        centro_financiero: catcentrofinanciero.centro_financiero
      row: 14
      col: 0
      width: 14
      height: 8

    - name: info_no_disponible_movimientos
      type: text
      body_text: "<div style='background:#FFF3F3; border:1px solid #FFCDD2; border-left:5px solid #E53935; border-radius:8px; padding:20px; height:85%;'><h3 style='color:#B71C1C; font-size:16px; margin:0 0 10px 0;'>⚠️ Indicadores de Fondeo y Saldo No Disponibles</h3><ul style='color:#C62828; font-size:13px; margin:0; padding-left:18px; line-height:1.6;'><li><b>Días de alta a primer fondeo:</b> No disponible (requiere fecha y evento de primera transferencia).</li><li><b>AUM total y flujo neto por cohorte:</b> No disponible (no existen saldos ni movimientos monetarios en la fuente).</li><li><b>Tasa de fuga monetaria:</b> Sustituida por cancelaciones en seguros; en inversiones requiere movimientos de retiros totales.</li></ul></div>"
      row: 14
      col: 14
      width: 10
      height: 8
