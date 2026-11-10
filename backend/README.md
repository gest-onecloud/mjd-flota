# Backend MJD Flota

API FastAPI para cálculos, reportes y gráficas.

## Correr localmente

```bash
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Editar .env con tus claves de Supabase
uvicorn app.main:app --reload --port 8000
```

## Endpoints principales

- `GET /api/dashboard/resumen`
- `GET /api/reportes/flujo-caja`
- `GET /api/reportes/indicadores`
- `GET /api/flota/vehiculos`
- `GET /health`
