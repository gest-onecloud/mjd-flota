# MJD Flota

Sistema de Control de Flota Vehicular para empresas de transporte.

Arquitectura:
- **Frontend**: React + Vite (UI separada de estilos y lógica)
- **Backend**: FastAPI (cálculos y gráficas) en Render
- **Base de datos**: Supabase (PostgreSQL)
- **Repositorio**: GitHub (monorepo)

## Estructura

```
mjd-flota/
├── frontend/          # React + Vite
├── backend/           # FastAPI
├── supabase/          # Migraciones SQL
├── docs/
└── README.md
```

## Requisitos

- Node.js 18+
- Python 3.11+
- Cuenta Supabase
- Cuenta Render (backend)
- Cuenta Vercel o Render (frontend)

## Instalación rápida

### Backend
```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
uvicorn app.main:app --reload
```

### Frontend
```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

## Variables de entorno

Ver `.env.example` en cada carpeta.

## Deploy

- Backend → Render (Web Service, Python)
- Frontend → Vercel o Render (Static Site)
- Base de datos → Supabase

## Colores e iconos

Se mantienen los del proyecto original:
- Primary: `#1e3a5f`
- Accent: `#2d6a9f`
- Iconos: Font Awesome (truck, user-tie, route, wrench, etc.)
