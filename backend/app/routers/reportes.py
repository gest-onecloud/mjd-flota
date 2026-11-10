from fastapi import APIRouter
from typing import Dict, Any, List

router = APIRouter()

@router.get("/flujo-caja")
async def get_flujo_caja() -> Dict[str, Any]:
    """Datos para gráficas de flujo de caja"""
    # TODO: calcular con pandas desde Supabase
    return {
        "meses": ["Ene", "Feb", "Mar", "Oct", "Nov"],
        "ingresos": [0, 0, 0, 237150, 63060],
        "egresos": [4000, 3100, 17500, 22530, 16300],
        "utilidad": [-4000, -3100, -17500, 214620, 46760]
    }

@router.get("/indicadores")
async def get_indicadores() -> List[Dict[str, Any]]:
    """KPIs generales"""
    return [
        {"nombre": "Ingreso medio por viaje", "valor": 37526.25, "unidad": "$/viaje"},
        {"nombre": "Gasto medio por viaje", "valor": 1043.12, "unidad": "$/viaje"},
        {"nombre": "Ingresos por Km", "valor": 130.53, "unidad": "$/Km"}
    ]
