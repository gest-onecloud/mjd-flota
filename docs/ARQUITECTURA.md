# MJD Flota - Documentación

## Arquitectura

- Frontend React (Vite) → consume API y Supabase
- Backend FastAPI → cálculos pesados, reportes, datos para gráficas
- Supabase → base de datos + auth

## Colores

- `--primary: #1e3a5f`
- `--accent: #2d6a9f`

## Próximos pasos

1. Conectar Supabase client en frontend
2. Implementar CRUD real
3. Calcular reportes con pandas en backend
4. Agregar gráficas con Chart.js / Recharts
5. Configurar deploy en Render + Vercel
