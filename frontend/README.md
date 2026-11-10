# Frontend MJD Flota

React + Vite. Estilos en `/src/styles`, componentes en `/src/components` y `/src/pages`.

Preparado para desplegarse como **sitio estático en IONOS**.

## Desarrollo local

```bash
cd frontend
npm install
cp .env.example .env
# Edita .env con tus claves
npm run dev
```

Abre http://localhost:5173

## Despliegue en IONOS (sitio estático)

1. Configura el `.env` con la URL de tu backend en Render:
   ```
   VITE_API_URL=https://tu-backend.onrender.com
   ```

2. Genera el build:
   ```bash
   npm run build
   ```

3. Sube **todo el contenido** de la carpeta `dist/` por SFTP a la carpeta pública de tu dominio en IONOS (`/httpdocs/` o `/public_html/`).

4. Abre tu dominio (ej. `https://mjd-solutions.mx`).

**Nota:** Se usa `HashRouter` (`#/ruta`) para que funcione sin configuración extra de rewrites en IONOS.