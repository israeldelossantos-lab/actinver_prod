---
- dashboard: plizas_y_seguros__portal_actinver
  title: Pólizas y Seguros — Portal Actinver
  preferred_viewer: dashboards-next
  style: modern
  description: Monitoreo de puntualidad de cobranza, domiciliación, vencimientos de
    cartera y emisión de primas.
  preferred_slug: B7LH47CYH2q3Guie48NLVd
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style='background: linear-gradient(135deg, #0A0E12 0%, #1A2433 100%); border-radius: 12px; padding: 18px 26px; border-left: 6px solid #0F6FF5; overflow: hidden;'>
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Iniciativa: Pólizas y Seguros</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Monitoreo de emisión, renovación, cobranza a tiempo y domiciliación de pólizas de seguros por línea de negocio y asesor patrimonial.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <span style='color: #FFFFFF; font-weight: 700; padding: 5px 12px; border-radius: 999px; background: #0F6FF5; white-space: nowrap;'>Seguros</span>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::vision_360' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Visión 360</a>
          <a href='/dashboards/actinver::geografia' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Geografía</a>
          <a href='/dashboards/actinver::calidad_datos' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Calidad de datos</a>
          <a href='/dashboards/actinver::contexto_mercado' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Contexto de mercado</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Prima Neta Emitida
    name: Prima Neta Emitida
    model: actinver
    explore: primas
    type: single_value
    fields: [primas.fecha_emision_poliza_month, primas.prima_neta_emitida]
    filters:
      primas.fecha_emision_poliza_month: 24 months ago for 24 months
    sorts: [primas.fecha_emision_poliza_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: variacion
      label: Variación
      expression: "${primas.prima_neta_emitida} / offset(${primas.prima_neta_emitida},\
        \ 1) - 1"
      value_format_name: percent_1
      _kind_hint: measure
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Prima Neta Emitida (último mes)
    show_comparison: true
    comparison_type: change
    comparison_label: vs mes anterior
    hidden_fields: [primas.fecha_emision_poliza_month]
    value_format: "$#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 8
    col: 0
    width: 15
    height: 5
    tab_name: ''
  - title: Pólizas emitidas
    name: Pólizas emitidas
    model: actinver
    explore: primas
    type: single_value
    fields: [primas.count_polizas]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Pólizas emitidas
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 8
    col: 15
    width: 15
    height: 5
    tab_name: ''
  - title: Pólizas renovadas
    name: Pólizas renovadas
    model: actinver
    explore: primas
    type: single_value
    fields: [primas.count_polizas]
    filters:
      primas.id_tipo_transaccion: '2'
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Pólizas renovadas
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 8
    col: 30
    width: 12
    height: 5
    tab_name: ''
  - title: Recibos cobrados
    name: Recibos cobrados
    model: actinver
    explore: cobranza
    type: single_value
    fields: [cobranza.fecha_pago_month, cobranza.total_recibos]
    filters:
      cobranza.fecha_pago_month: 24 months ago for 24 months
    sorts: [cobranza.fecha_pago_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: variacion
      label: Variación
      expression: "${cobranza.total_recibos} / offset(${cobranza.total_recibos}, 1)\
        \ - 1"
      value_format_name: percent_1
      _kind_hint: measure
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Recibos cobrados (último mes)
    show_comparison: true
    comparison_type: change
    comparison_label: vs mes anterior
    hidden_fields: [cobranza.fecha_pago_month]
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 8
    col: 42
    width: 15
    height: 5
    tab_name: ''
  - title: Desviación promedio
    name: Desviación promedio
    model: actinver
    explore: cobranza
    type: single_value
    fields: [cobranza.desviacion_promedio_dias]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#FFFFFF"
    show_single_value_title: true
    single_value_title: Desviación promedio (días)
    value_format: '0.0'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    show_chart_component: false
    enable_conditional_formatting: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 8
    col: 57
    width: 15
    height: 5
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>% Cobranza a tiempo<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 13
    col: 0
    width: 18
    height: 2
    tab_name: ''
  - title: "% Cobranza a tiempo"
    name: "% Cobranza a tiempo"
    model: actinver
    explore: cobranza
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [cobranza.pct_recibos_a_tiempo]
    fill_color: "#0f6ff5"
    background_color: "#d9d9d9"
    range_min: 0
    range_max: 1
    value_formatting: 0.0%
    range_formatting: 0%
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 15
    col: 0
    width: 18
    height: 12
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>% Renovación<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 13
    col: 18
    width: 18
    height: 2
    tab_name: ''
  - title: "% Renovación"
    name: "% Renovación"
    model: actinver
    explore: primas
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [primas.id_tipo_transaccion, primas.count_polizas]
    filters:
      primas.id_tipo_transaccion: '12'
    dynamic_fields:
    - table_calculation: pct_renovacion
      label: "% Renovación"
      expression: sum(if(${primas.id_tipo_transaccion} = 2, ${primas.count_polizas},
        0)) / sum(${primas.count_polizas})
      value_format_name: percent_1
      _kind_hint: measure
    hidden_fields: [primas.id_tipo_transaccion, primas.count_polizas]
    fill_color: "#0f6ff5"
    background_color: "#d9d9d9"
    range_min: 0
    range_max: 1
    value_formatting: 0.0%
    range_formatting: 0%
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 15
    col: 18
    width: 18
    height: 12
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Distribución de prima por línea de negocio y producto<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 13
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: Distribución de prima por línea de negocio y producto
    name: Distribución de prima por línea de negocio y producto
    model: actinver
    explore: primas
    type: looker_column
    fields: [producto.lob, producto.producto, primas.prima_neta_emitida]
    pivots: [producto.lob]
    filters:
      primas.prima_neta_emitida: ">0"
    advanced_vis_config: "{ chart: { type: 'treemap' } }"
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 15
    col: 36
    width: 36
    height: 12
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Qué cobramos a tiempo?<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 27
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: "¿Qué cobramos a tiempo?"
    name: "¿Qué cobramos a tiempo?"
    model: actinver
    explore: cobranza
    type: looker_pie
    fields: [cobranza.rango_desviacion_pago, cobranza.total_recibos]
    limit: 5000
    column_limit: 50
    inner_radius: 50
    colors: ["#3dbe7a", "#12998a", "#e3a33b", "#f0645a"]
    show_view_names: false
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 29
    col: 0
    width: 24
    height: 14
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Las pólizas domiciliadas pagan con menos atraso?<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 27
    col: 24
    width: 24
    height: 2
    tab_name: ''
  - title: "¿Las pólizas domiciliadas pagan con menos atraso?"
    name: "¿Las pólizas domiciliadas pagan con menos atraso?"
    model: actinver
    explore: cobranza
    type: looker_column
    fields: [domiciliado.es_domiciliada, cobranza.desviacion_promedio_dias]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    label_value_format: '0.0'
    y_axis_gridlines: true
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 29
    col: 24
    width: 24
    height: 14
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Dónde se concentra el atraso?<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 27
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: "¿Dónde se concentra el atraso?"
    name: "¿Dónde se concentra el atraso?"
    model: actinver
    explore: cobranza
    type: looker_bar
    fields: [producto.lob, cobranza.pct_recibos_criticos]
    sorts: [cobranza.pct_recibos_criticos desc]
    limit: 5000
    column_limit: 50
    colors: ["#f0645a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: 0.0%
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 29
    col: 48
    width: 24
    height: 14
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Prima emitida mensual por línea de negocio<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 43
    col: 0
    width: 48
    height: 2
    tab_name: ''
  - title: Prima emitida mensual por línea de negocio
    name: Prima emitida mensual por línea de negocio
    model: actinver
    explore: primas
    type: looker_column
    fields: [primas.fecha_emision_poliza_month, producto.lob, primas.prima_neta_emitida]
    pivots: [producto.lob]
    filters:
      primas.fecha_emision_poliza_month: 24 months ago for 24 months
    limit: 5000
    column_limit: 50
    stacking: normal
    colors: ["#0f6ff5", "#12998a", "#ad883a", "#8573e8", "#d9704c"]
    show_view_names: false
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 45
    col: 0
    width: 48
    height: 14
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Nuevo negocio o renovación?<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 43
    col: 48
    width: 24
    height: 2
    tab_name: ''
  - title: "¿Nuevo negocio o renovación?"
    name: "¿Nuevo negocio o renovación?"
    model: actinver
    explore: primas
    type: looker_column
    fields: [primas.tipo_transaccion, primas.count_polizas]
    filters:
      primas.id_tipo_transaccion: '12'
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5", "#12998a"]
    show_view_names: false
    show_value_labels: true
    label_value_format: "#,##0"
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 45
    col: 48
    width: 24
    height: 14
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Qué pólizas vencen en los próximos 90 días?<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 59
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: "¿Qué pólizas vencen en los próximos 90 días?"
    name: "¿Qué pólizas vencen en los próximos 90 días?"
    model: actinver
    explore: polizas
    type: looker_grid
    fields: [polizas.poliza, producto.producto, producto.lob, catasesor.asesor_etiqueta,
      polizas.fecha_fin_vigencia_date]
    filters:
      polizas.fecha_fin_vigencia_date: today for 90 days
    sorts: [polizas.fecha_fin_vigencia_date asc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    series_labels:
      polizas.poliza: Póliza
      producto.producto: Producto
      producto.lob: Línea de negocio
      catasesor.asesor_etiqueta: Asesor
      polizas.fecha_fin_vigencia_date: Fin Vigencia
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    table_show_footer: true
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 61
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - name: " (11)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿A quién le ofrecemos domiciliar?<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 59
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: "¿A quién le ofrecemos domiciliar?"
    name: "¿A quién le ofrecemos domiciliar?"
    model: actinver
    explore: cobranza
    type: looker_grid
    fields: [cobranza.poliza, producto.producto, catasesor.asesor_etiqueta, cobranza.dias_desviacion,
      cobranza.monto_prima_pagada]
    filters:
      domiciliado.es_domiciliada: 'No'
      cobranza.es_critico: 'Yes'
    sorts: [cobranza.dias_desviacion desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: custom, custom: {
            id: actinver-azul, label: Actinver azul, type: continuous, stops: [{color: "#e8f0fe",
                offset: 0}, {color: "#87b7fa", offset: 50}, {color: "#0f6ff5", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [cobranza.dias_desviacion]}]
    series_labels:
      cobranza.poliza: Póliza
      producto.producto: Producto
      catasesor.asesor_etiqueta: Asesor
      cobranza.dias_desviacion: Días de Desviación
      cobranza.monto_prima_pagada: Prima Pagada
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    table_show_footer: true
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 61
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - name: " (12)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>¿Cuántas pólizas vencen en los próximos 30, 60 y 90 días?<div\
      \ style='flex:1; height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 77
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: "¿Cuántas pólizas vencen en los próximos 30, 60 y 90 días?"
    name: "¿Cuántas pólizas vencen en los próximos 30, 60 y 90 días?"
    model: actinver
    explore: polizas
    type: looker_column
    fields: [dt_vencimientos_seguros.ventana_vencimiento, dt_vencimientos_seguros.polizas_por_vencer_count]
    filters:
      dt_vencimientos_seguros.ventana_vencimiento: 1. Por vencer (30 días),2. Por
        vencer (60 días),3. Por vencer (90 días)
    sorts: [dt_vencimientos_seguros.ventana_vencimiento]
    limit: 5000
    column_limit: 50
    colors: ["#0f6ff5"]
    show_view_names: false
    show_value_labels: true
    x_axis_label: ''
    modern2026: true
    title_hidden: true
    listen:
      lob: producto.lob
      producto: producto.producto
    row: 79
    col: 0
    width: 72
    height: 14
    tab_name: ''
  filters:
  - name: lob
    title: Línea de negocio
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: primas
    listens_to_filters: []
    field: producto.lob
  - name: producto
    title: Producto
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: actinver
    explore: primas
    listens_to_filters: []
    field: producto.producto
