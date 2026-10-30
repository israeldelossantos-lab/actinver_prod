project_name: "actinver"

# Datasets por dominio de negocio (en us-central1)
constant: dataset_cliente_producto {
  value: "vertex-ia-503623.cliente_producto"
  export: none
}

constant: dataset_seguros {
  value: "vertex-ia-503623.seguros"
  export: none
}

constant: dataset_spine {
  value: "vertex-ia-503623.spine"
  export: none
}

# Retrocompatibilidad general
constant: dataset_actinver {
  value: "vertex-ia-503623.spine"
  export: none
}

# Umbrales de desviación de pago (Puntualidad de cobranza en seguros)
# [VALIDAR] pendiente #10
constant: umbral_gracia_dias {
  value: "15"
  export: none
}

# [VALIDAR] pendiente #10
constant: umbral_critico_dias {
  value: "30"
  export: none
}
