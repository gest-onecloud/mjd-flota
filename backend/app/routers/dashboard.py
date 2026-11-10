from fastapi import APIRouter
from typing import Dict, Any

router = APIRouter()

@router.get("/resumen")
async def get_resumen() -> Dict[str, Any]:
    """Resumen general para el dashboard"""
    # TODO: conectar a Supabase y calcular
    return {
        "vehiculos": 5,
        "conductores": 6,
        "rutas": 8,
        "mantenimientos": 5,
        "multas": 2,
        "talleres": 6,
        "alertas": [
            {"placa": "BJU-435", "mensaje": "Requiere mantenimiento preventivo", "tipo": "danger"}
        ]
    }
