from fastapi import APIRouter
from typing import List, Dict, Any

router = APIRouter()

@router.get("/vehiculos")
async def get_vehiculos() -> List[Dict[str, Any]]:
    """Lista de vehículos (placeholder)"""
    return [
        {"placa": "ABC-123", "marca": "Mitsubishi", "modelo": "Eclipse Cross", "estado": "Disponible"},
        {"placa": "BJU-435", "marca": "Scania", "modelo": "Q-500", "estado": "Mantener"}
    ]
