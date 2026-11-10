from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routers import dashboard, reportes, flota

app = FastAPI(
    title="MJD Flota API",
    description="Backend para cálculos y reportes de Control de Flota Vehicular",
    version="0.1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Ajustar en producción
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(dashboard.router, prefix="/api/dashboard", tags=["Dashboard"])
app.include_router(reportes.router, prefix="/api/reportes", tags=["Reportes"])
app.include_router(flota.router, prefix="/api/flota", tags=["Flota"])

@app.get("/")
async def root():
    return {"message": "MJD Flota API", "status": "ok"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
