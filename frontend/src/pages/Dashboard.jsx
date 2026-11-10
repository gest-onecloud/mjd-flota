import { useEffect, useState } from 'react';
import axios from 'axios';

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:8000';

export default function Dashboard() {
  const [resumen, setResumen] = useState(null);

  useEffect(() => {
    axios.get(`${API_URL}/api/dashboard/resumen`)
      .then(res => setResumen(res.data))
      .catch(() => setResumen({
        vehiculos: 0, conductores: 0, rutas: 0, mantenimientos: 0, multas: 0, talleres: 0
      }));
  }, []);

  if (!resumen) return <div>Cargando...</div>;

  const cards = [
    { icon: 'fa-truck', color: 'primary', value: resumen.vehiculos, label: 'Vehículos' },
    { icon: 'fa-user-tie', color: 'success', value: resumen.conductores, label: 'Conductores' },
    { icon: 'fa-route', color: 'info', value: resumen.rutas, label: 'Rutas' },
    { icon: 'fa-wrench', color: 'warning', value: resumen.mantenimientos, label: 'Mantenimientos' },
    { icon: 'fa-exclamation-triangle', color: 'danger', value: resumen.multas, label: 'Multas' },
    { icon: 'fa-tools', color: 'secondary', value: resumen.talleres, label: 'Talleres' },
  ];

  return (
    <div>
      <div className="page-header mb-4">
        <h1><i className="fas fa-tachometer-alt me-2"></i>Dashboard</h1>
        <p className="text-muted">Resumen general de MJD Flota</p>
      </div>
      <div className="row g-3">
        {cards.map((c) => (
          <div key={c.label} className="col-6 col-md-4 col-lg-2">
            <div className="card card-stat h-100">
              <div className="card-body d-flex align-items-center gap-3">
                <div className={`icon-box bg-${c.color} bg-opacity-10 text-${c.color}`}>
                  <i className={`fas ${c.icon}`}></i>
                </div>
                <div>
                  <div className="fs-4 fw-bold">{c.value}</div>
                  <div className="text-muted small">{c.label}</div>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
