- dashboard: ficha_cliente
  title: "Ficha del Cliente 360"
  description: "Detalle integral del cliente: perfil KYC, tenencia de familias de productos, comparativo radar vs red, historial y recomendación personalizada."
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  refresh: 1 hour
  filters_location_top: true

  filters:
    - name: Cliente
      title: "ID Cliente"
      type: field_filter
      default_value: "1001"
      allow_multiple_values: false
      required: true
      ui_config:
        type: dropdown_menu
        display: inline
      model: actinver
      explore: clientes
      field: clientes.id_cliente_num

  elements:
    - name: nav_header
      type: text
      title_text: ""
      subtitle_text: ""
      body_text: "[← Volver a Visión 360](/dashboards/actinver::vision_360) · [Sucursales](/dashboards/actinver::desempeno_sucursales) · [Vinculación](/dashboards/actinver::vinculacion_cliente) · [Seguros](/dashboards/actinver::polizas) · [Ciclo de vida](/dashboards/actinver::ciclo_vida) · [Geografía](/dashboards/actinver::geografia) · [Calidad de datos](/dashboards/actinver::calidad_datos)"
      row: 0
      col: 0
      width: 24
      height: 1

    - name: perfil_cliente_header
      title: "Resumen del Cliente"
      model: actinver
      explore: clientes
      type: looker_single_record
      fields: [
        clientes.foto,
        clientes.id_cliente_num,
        clientes.tipo_persona_desc,
        catcentrofinanciero.centro_financiero,
        catcentrofinanciero.estado_nombre,
        catasesor.asesor_etiqueta,
        clientes.fecha_alta_date,
        dt_escalera_vinculacion.escalon_vinculacion,
        clientes.segmento_awm,
        clientes.cliente_seguro
      ]
      limit: 1
      show_view_names: false
      listen:
        Cliente: clientes.id_cliente_num
      row: 1
      col: 0
      width: 14
      height: 4

    - name: kpi_productos_validos
      title: "Productos Válidos"
      model: actinver
      explore: clientes
      type: single_value
      fields: [dt_escalera_vinculacion.total_productos_validos]
      custom_color_enabled: true
      custom_color: "#0f6ff5"
      show_single_value_title: true
      single_value_title: "Portafolio Activo"
      value_format: "#,##0"
      listen:
        Cliente: clientes.id_cliente_num
      row: 1
      col: 14
      width: 5
      height: 2

    - name: kpi_cuentas
      title: "Cuentas Abiertas"
      model: actinver
      explore: clientes
      type: single_value
      fields: [cuenta.count]
      custom_color_enabled: true
      custom_color: "#12998a"
      show_single_value_title: true
      single_value_title: "Total Cuentas"
      value_format: "#,##0"
      listen:
        Cliente: clientes.id_cliente_num
      row: 1
      col: 19
      width: 5
      height: 2

    - name: kpi_antiguedad
      title: "Antigüedad (Años)"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.fecha_alta_date]
      dynamic_fields:
        - table_calculation: antiguedad_anios
          label: "Años"
          expression: "round(diff_days(${clientes.fecha_alta_date}, now()) / 365.25, 1)"
          value_format_name: decimal_1
      hidden_fields: [clientes.fecha_alta_date]
      custom_color_enabled: true
      custom_color: "#ad883a"
      show_single_value_title: true
      single_value_title: "Años de Relación"
      listen:
        Cliente: clientes.id_cliente_num
      row: 3
      col: 14
      width: 5
      height: 2

    - name: kpi_riesgo_mod
      title: "Grado de Riesgo"
      model: actinver
      explore: clientes
      type: single_value
      fields: [clientes.riesgo_mod]
      custom_color_enabled: true
      custom_color: "#8573e8"
      show_single_value_title: true
      single_value_title: "Nivel de Riesgo"
      listen:
        Cliente: clientes.id_cliente_num
      row: 3
      col: 19
      width: 5
      height: 2

    - name: chart_spider_tenencia
      title: "Comparativo de Tenencia por Familia: Cliente vs Sucursal vs Red (Radar)"
      model: actinver
      explore: clientes
      type: marketplace_viz_spider::spider-marketplace
      fields: [
        dt_tenencia_familia.nivel,
        dt_tenencia_familia.pct_cuenta_eje,
        dt_tenencia_familia.pct_mercado_dinero,
        dt_tenencia_familia.pct_fondos_inversion,
        dt_tenencia_familia.pct_mercado_capitales,
        dt_tenencia_familia.pct_liquidez_divisas,
        dt_tenencia_familia.pct_credito
      ]
      sorts: [dt_tenencia_familia.nivel asc]
      limit: 3
      listen:
        Cliente: clientes.id_cliente_num
      row: 5
      col: 0
      width: 12
      height: 9

    - name: table_siguiente_producto
      title: "Siguientes Productos Sugeridos (Propensión y Lift)"
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        dt_siguiente_producto_sugerido.producto_1,
        dt_siguiente_producto_sugerido.pct_1,
        dt_siguiente_producto_sugerido.lift_1,
        dt_siguiente_producto_sugerido.porque_1,
        dt_siguiente_producto_sugerido.producto_2,
        dt_siguiente_producto_sugerido.pct_2,
        dt_siguiente_producto_sugerido.lift_2,
        dt_siguiente_producto_sugerido.producto_3,
        dt_siguiente_producto_sugerido.pct_3,
        dt_siguiente_producto_sugerido.lift_3
      ]
      limit: 1
      show_view_names: false
      show_row_numbers: false
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        Cliente: clientes.id_cliente_num
      row: 5
      col: 12
      width: 12
      height: 4

    - name: table_cuentas_cliente
      title: "Cuentas y Contratos del Cliente"
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        cuenta.cuenta_flex,
        cuenta.fecha_apertura_date,
        cattipocontrato.tipo_contrato,
        cuenta.tipo_entidad_bancaria
      ]
      sorts: [cuenta.fecha_apertura_date desc]
      show_view_names: false
      show_row_numbers: true
      table_theme: white
      header_background_color: "#1A2433"
      header_font_color: "#FFFFFF"
      listen:
        Cliente: clientes.id_cliente_num
      row: 9
      col: 12
      width: 12
      height: 5

    - name: table_kyc_expediente
      title: "Expediente KYC y Validación Regulatoria"
      model: actinver
      explore: clientes
      type: looker_grid
      fields: [
        clientes.id_cliente_num,
        clientes.autorizacion_consulta_buro,
        clientes.biometrico_facial,
        clientes.fiel_vigente,
        clientes.fecha_vencimiento_fiel_date
      ]
      limit: 1
      show_view_names: false
      show_row_numbers: false
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
        Cliente: clientes.id_cliente_num
      row: 14
      col: 0
      width: 24
      height: 4
