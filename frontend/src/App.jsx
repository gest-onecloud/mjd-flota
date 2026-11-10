import { HashRouter, Routes, Route, NavLink } from 'react-router-dom';
import './styles/main.css';
import Dashboard from './pages/Dashboard';
import Flota from './pages/Flota';

const menuItems = [
  { path: '/', icon: 'fa-tachometer-alt', label: 'Dashboard' },
  { path: '/flota', icon: 'fa-truck', label: 'Flota' },
  { path: '/conductores', icon: 'fa-user-tie', label: 'Conductores' },
  { path: '/rutas', icon: 'fa-route', label: 'Rutas' },
  { path: '/mantenimiento', icon: 'fa-wrench', label: 'Mantenimiento' },
  { path: '/seguros', icon: 'fa-shield-alt', label: 'Seguros' },
  { path: '/impuestos', icon: 'fa-file-invoice-dollar', label: 'Impuestos' },
  { path: '/multas', icon: 'fa-exclamation-triangle', label: 'Multas' },
  { path: '/talleres', icon: 'fa-tools', label: 'Talleres' },
  { path: '/flujo', icon: 'fa-chart-line', label: 'Flujo de Caja' },
  { path: '/reportes', icon: 'fa-chart-bar', label: 'Reportes' },
];

function Sidebar() {
  return (
    <nav className="sidebar">
      <div className="sidebar-brand">
        <i className="fas fa-truck-moving"></i>
        <span>MJD Flota</span>
      </div>
      <ul className="nav flex-column mt-2">
        {menuItems.map((item) => (
          <li key={item.path} className="nav-item">
            <NavLink
              to={item.path}
              className={({ isActive }) => `nav-link ${isActive ? 'active' : ''}`}
            >
              <i className={`fas ${item.icon}`}></i> {item.label}
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  );
}

export default function App() {
  return (
    <HashRouter>
      <div className="d-flex">
        <Sidebar />
        <div className="main-content flex-grow-1">
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/flota" element={<Flota />} />
            <Route path="*" element={<div className="p-4"><h2>En construcción</h2></div>} />
          </Routes>
        </div>
      </div>
    </HashRouter>
  );
}