-- MJD Flota - Esquema inicial
-- Basado en la estructura del Excel original

-- Vehículos
CREATE TABLE vehiculos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    tipo TEXT,
    marca TEXT,
    modelo TEXT,
    placa TEXT UNIQUE NOT NULL,
    nro_serie TEXT,
    color TEXT,
    anio INTEGER,
    carga_maxima_kg NUMERIC,
    estado_vehiculo TEXT DEFAULT 'Disponible',
    ciclo_mantenimiento_km INTEGER,
    kms_odometro_inicial NUMERIC,
    kms_odometro_mantenimiento NUMERIC,
    kms_odometro_actual NUMERIC,
    falta_proximo_mantenimiento NUMERIC,
    estado_mantenimiento TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Conductores
CREATE TABLE conductores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    doc_identidad TEXT UNIQUE,
    nombre TEXT NOT NULL,
    nro_licencia TEXT,
    direccion TEXT,
    telefono TEXT,
    calificacion TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Rutas / Viajes
CREATE TABLE rutas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    fecha_salida DATE,
    fecha_llegada DATE,
    placa_vehiculo TEXT REFERENCES vehiculos(placa),
    estado_vehiculo TEXT,
    conductor TEXT,
    origen TEXT,
    destino TEXT,
    kms_inicial NUMERIC,
    kms_final NUMERIC,
    kms_recorridos NUMERIC,
    peso_carga_kg NUMERIC,
    costo_por_kg NUMERIC,
    ingreso_total NUMERIC,
    estacion_combustible TEXT,
    tipo_combustible TEXT,
    precio_galon NUMERIC,
    total_combustible NUMERIC,
    gasto_peajes NUMERIC,
    gasto_comidas NUMERIC,
    otros_gastos NUMERIC,
    gasto_total NUMERIC,
    volumen_combustible_gal NUMERIC,
    recorrido_por_galon NUMERIC,
    ingreso_por_km NUMERIC,
    observaciones TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Mantenimientos
CREATE TABLE mantenimientos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    placa_vehiculo TEXT REFERENCES vehiculos(placa),
    taller TEXT,
    fecha_entrada DATE,
    fecha_salida DATE,
    tipo TEXT,
    kilometraje_odometro NUMERIC,
    paquete TEXT,
    causas TEXT,
    costo_total NUMERIC,
    fecha_pago DATE,
    observaciones TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seguros
CREATE TABLE seguros (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    placa_vehiculo TEXT REFERENCES vehiculos(placa),
    aseguradora TEXT,
    poliza TEXT,
    fecha_inicio DATE,
    fecha_vencimiento DATE,
    importe_pagado NUMERIC,
    fecha_pago DATE,
    estado_poliza TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Impuestos
CREATE TABLE impuestos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    placa_vehiculo TEXT REFERENCES vehiculos(placa),
    tipo_impuesto TEXT,
    anio_impuesto INTEGER,
    impuesto NUMERIC,
    fecha_pago DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Multas
CREATE TABLE multas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    fecha DATE,
    nro_viaje TEXT,
    placa_vehiculo TEXT REFERENCES vehiculos(placa),
    conductor TEXT,
    infraccion TEXT,
    importe_multa NUMERIC,
    importe_pagado NUMERIC,
    debe NUMERIC,
    estado_pago TEXT,
    observaciones TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Talleres
CREATE TABLE talleres (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nro INTEGER,
    nombre TEXT NOT NULL,
    direccion TEXT,
    telefono TEXT,
    correo TEXT,
    contacto_principal TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices útiles
CREATE INDEX idx_vehiculos_placa ON vehiculos(placa);
CREATE INDEX idx_rutas_placa ON rutas(placa_vehiculo);
CREATE INDEX idx_rutas_fecha ON rutas(fecha_salida);
CREATE INDEX idx_mantenimientos_placa ON mantenimientos(placa_vehiculo);

-- RLS (ejemplo básico - ajustar según necesidades)
ALTER TABLE vehiculos ENABLE ROW LEVEL SECURITY;
ALTER TABLE conductores ENABLE ROW LEVEL SECURITY;
ALTER TABLE rutas ENABLE ROW LEVEL SECURITY;
-- Agregar políticas según roles
