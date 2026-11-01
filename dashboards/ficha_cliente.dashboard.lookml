---
- dashboard: ficha_cliente
  title: Ficha del Cliente 360
  preferred_viewer: dashboards-next
  style: modern
  crossfilter_enabled: true
  description: 'Detalle integral del cliente: perfil KYC, tenencia de familias de
    productos, comparativo radar vs red, historial y recomendación personalizada.'
  refresh: 1 hour
  preferred_slug: zi8I2hNQwXiqHy8P3KTw0Y
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
        <h2 style='color: #FFFFFF; font-size: 24px; font-weight: 700; margin: 0 0 4px 0;'>Ficha del Cliente 360</h2>
        <p style='color: #FFFFFF; font-size: 13px; margin: 0; line-height: 1.4; opacity: 0.85;'>Expediente único del cliente: perfil KYC, tenencia comparativa por familia de productos, cuentas activas y propensión comercial.</p>
        <div style='display: flex; flex-wrap: wrap; gap: 8px; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.10); font-size: 12.5px; line-height: 1;'>
          <a href='/dashboards/actinver::vision_360' style='color: #FFFFFF; font-weight: 700; text-decoration: none; padding: 5px 12px; border-radius: 999px; background: rgba(15,111,245,0.22); border: 1px solid #0F6FF5; white-space: nowrap;'>← Volver a Visión 360</a>
          <a href='/dashboards/actinver::desempeno_sucursales' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Sucursales</a>
          <a href='/dashboards/actinver::vinculacion_cliente' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Vinculación</a>
          <a href='/dashboards/actinver::polizas' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Seguros</a>
          <a href='/dashboards/actinver::ciclo_vida' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Ciclo de vida</a>
          <a href='/dashboards/actinver::geografia' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Geografía</a>
          <a href='/dashboards/actinver::calidad_datos' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Calidad de datos</a>
          <a href='/dashboards/actinver::contexto_mercado' style='color: #C9D7EE; text-decoration: none; padding: 5px 12px; border-radius: 999px; border: 1px solid rgba(255,255,255,0.14); white-space: nowrap;'>Contexto de mercado</a>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 7
    tab_name: ''
  - title: Foto del cliente
    name: Foto del cliente
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.foto_perfil]
    limit: 1
    show_single_value_title: false
    show_comparison: false
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 7
    col: 0
    width: 12
    height: 12
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Resumen del Cliente<div style='flex:1; height:2px; background-color:#002D6F;\
      \ margin:0 12px;'></div></div>"
    row: 7
    col: 12
    width: 30
    height: 2
    tab_name: ''
  - title: Resumen del Cliente
    name: Resumen del Cliente
    model: actinver
    explore: clientes
    type: looker_single_record
    fields: [clientes.id_cliente_num, clientes.tipo_persona_desc, catcentrofinanciero.centro_financiero,
      catcentrofinanciero.estado_nombre, catasesor.asesor_etiqueta, clientes.fecha_hora_creacion_date,
      dt_escalera_vinculacion.escalon_vinculacion, clientes.segmento_awm, clientes.cliente_seguro]
    sorts: [clientes.fecha_hora_creacion_date desc]
    limit: 1
    column_limit: 50
    show_view_names: false
    global_tooltip_options:
      custom_tooltips_enabled: false
      style:
        font_size: 12
        font_family: Roboto, 'Noto Sans', 'Noto Sans JP', 'Noto Sans CJK KR', 'Noto
          Sans Arabic UI', 'Noto Sans Devanagari UI', 'Noto Sans Hebrew', 'Noto Sans
          Thai UI', Helvetica, Arial, sans-serif
        font_color: "#FFFFFF"
        background_color: "#262D33"
        border_radius: 4
        border_color: transparent
        box_shadow: none
        align: left
      template: |-
        <div style="padding: 5px 0;">
                <div>ID de Cliente (Numérico)</div>
                <div style="font-weight: bold;">{{ clientes.id_cliente_num }}</div>
              </div><div style="padding: 5px 0;">
                <div>Persona Física vs Moral</div>
                <div style="font-weight: bold;">{{ clientes.tipo_persona_desc }}</div>
              </div><div style="padding: 5px 0;">
                <div>Centro Financiero (Nombre)</div>
                <div style="font-weight: bold;">{{ catcentrofinanciero.centro_financiero }}</div>
              </div><div style="padding: 5px 0;">
                <div>Estado Normalizado</div>
                <div style="font-weight: bold;">{{ catcentrofinanciero.estado_nombre }}</div>
              </div><div style="padding: 5px 0;">
                <div>Asesor</div>
                <div style="font-weight: bold;">{{ catasesor.asesor_etiqueta }}</div>
              </div><div style="padding: 5px 0;">
                <div>Fecha de Alta de Cliente Date</div>
                <div style="font-weight: bold;">{{ clientes.fecha_hora_creacion_date }}</div>
              </div><div style="padding: 5px 0;">
                <div>Escalón de Vinculación</div>
                <div style="font-weight: bold;">{{ dt_escalera_vinculacion.escalon_vinculacion }}</div>
              </div><div style="padding: 5px 0;">
                <div>Segmento AWM (Patrimonial) (Yes / No)</div>
                <div style="font-weight: bold;">{{ clientes.segmento_awm }}</div>
              </div><div style="padding: 5px 0;">
                <div>Cliente Seguro (Yes / No)</div>
                <div style="font-weight: bold;">{{ clientes.cliente_seguro }}</div>
              </div>
    enable_custom_tooltip: false
    modern2026: true
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 9
    col: 12
    width: 30
    height: 10
    tab_name: ''
  - title: Productos Válidos
    name: Productos Válidos
    model: actinver
    explore: clientes
    type: single_value
    fields: [dt_escalera_vinculacion.total_productos_validos]
    sorts: [dt_escalera_vinculacion.total_productos_validos]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#002D6F"
    show_single_value_title: true
    single_value_title: Portafolio Activo
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 7
    col: 42
    width: 15
    height: 4
    tab_name: ''
  - title: Cuentas Abiertas
    name: Cuentas Abiertas
    model: actinver
    explore: clientes
    type: single_value
    fields: [cuenta.count]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#002D6F"
    show_single_value_title: true
    single_value_title: Total Cuentas
    value_format: "#,##0"
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 7
    col: 57
    width: 15
    height: 4
    tab_name: ''
  - title: Antigüedad (Años)
    name: Antigüedad (Años)
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.fecha_hora_creacion_date]
    sorts: [clientes.fecha_hora_creacion_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: antiguedad_anios
      label: Años
      expression: round(diff_days(${clientes.fecha_hora_creacion_date}, now()) / 365.25,
        1)
      value_format_name: decimal_1
    hidden_fields: [clientes.fecha_hora_creacion_date]
    custom_color_enabled: true
    custom_color: "#002D6F"
    show_single_value_title: true
    single_value_title: Años de Relación
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 11
    col: 42
    width: 15
    height: 4
    tab_name: ''
  - title: Grado de Riesgo
    name: Grado de Riesgo
    model: actinver
    explore: clientes
    type: single_value
    fields: [clientes.riesgo_mod]
    sorts: [clientes.riesgo_mod]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#002D6F"
    show_single_value_title: true
    single_value_title: Nivel de Riesgo
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: [], background_color: "#002D6F",
        font_color: "#FFFFFF"}]
    enable_conditional_formatting: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 11
    col: 57
    width: 15
    height: 4
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Comparativo de Tenencia por Familia: Cliente vs Sucursal vs Red\
      \ (Radar)<div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div></div>"
    row: 19
    col: 0
    width: 36
    height: 2
    tab_name: ''
  - title: 'Comparativo de Tenencia por Familia: Cliente vs Sucursal vs Red (Radar)'
    name: 'Comparativo de Tenencia por Familia: Cliente vs Sucursal vs Red (Radar)'
    model: actinver
    explore: clientes
    type: marketplace_viz_spider::spider-marketplace
    fields: [dt_tenencia_familia.nivel, dt_tenencia_familia.pct_cuenta_eje, dt_tenencia_familia.pct_mercado_dinero,
      dt_tenencia_familia.pct_fondos_inversion, dt_tenencia_familia.pct_mercado_capitales,
      dt_tenencia_familia.pct_liquidez_divisas, dt_tenencia_familia.pct_credito]
    sorts: [dt_tenencia_familia.nivel asc]
    limit: 3
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 21
    col: 0
    width: 36
    height: 20
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Siguientes Productos Sugeridos (Propensión y Lift)<div style='flex:1;\
      \ height:2px; background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 19
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: Siguientes Productos Sugeridos (Propensión y Lift)
    name: Siguientes Productos Sugeridos (Propensión y Lift)
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [dt_siguiente_producto_sugerido.producto_1, dt_siguiente_producto_sugerido.pct_1,
      dt_siguiente_producto_sugerido.lift_1, dt_siguiente_producto_sugerido.porque_1,
      dt_siguiente_producto_sugerido.producto_2, dt_siguiente_producto_sugerido.pct_2,
      dt_siguiente_producto_sugerido.lift_2, dt_siguiente_producto_sugerido.producto_3,
      dt_siguiente_producto_sugerido.pct_3, dt_siguiente_producto_sugerido.lift_3]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: modern
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    modern2026: true
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 21
    col: 36
    width: 36
    height: 8
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Cuentas y Contratos del Cliente<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 29
    col: 36
    width: 36
    height: 2
    tab_name: ''
  - title: Cuentas y Contratos del Cliente
    name: Cuentas y Contratos del Cliente
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [cuenta.cuenta_flex, cuenta.fecha_apertura_date, cattipocontrato.tipo_contrato,
      cuenta.tipo_entidad_bancaria]
    sorts: [cuenta.fecha_apertura_date desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    table_theme: modern
    header_background_color: "#1A2433"
    header_font_color: "#FFFFFF"
    modern2026: true
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 31
    col: 36
    width: 36
    height: 10
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style='display:flex; align-items:center; justify-content:center;\
      \ font-family: Roboto, Arial, sans-serif; font-weight:400; font-size:14px; color:#002D6F;\
      \ width:100%;'><div style='flex:1; height:2px; background-color:#002D6F; margin:0\
      \ 12px;'></div>Expediente KYC y Validación Regulatoria<div style='flex:1; height:2px;\
      \ background-color:#002D6F; margin:0 12px;'></div></div>"
    row: 41
    col: 0
    width: 72
    height: 2
    tab_name: ''
  - title: Expediente KYC y Validación Regulatoria
    name: Expediente KYC y Validación Regulatoria
    model: actinver
    explore: clientes
    type: looker_grid
    fields: [clientes.id_cliente_num, clientes.autorizacion_consulta_buro, clientes.biometrico_facial,
      clientes.fiel_vigente, clientes.fecha_vencimiento_fiel_date]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: modern
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
    modern2026: true
    title_hidden: true
    listen:
      Cliente: clientes.id_cliente_num
    row: 43
    col: 0
    width: 72
    height: 8
    tab_name: ''
  filters:
  - name: Cliente
    title: ID Cliente
    type: field_filter
    default_value: '1001'
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: actinver
    explore: clientes
    listens_to_filters: []
    field: clientes.id_cliente_num
