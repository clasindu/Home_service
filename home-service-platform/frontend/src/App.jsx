import { Routes, Route, Navigate } from 'react-router-dom'
import LoginPage from './features/auth/LoginPage'
import RegisterPage from './features/auth/RegisterPage'
import DashboardPage from './features/auth/DashboardPage'
import DiagnosisPage from './features/diagnosis/DiagnosisPage'
import SearchPage from './features/search/SearchPage'
import BookingsPage from './features/booking/BookingsPage'
import WorkerProfilePage from './features/worker/WorkerProfilePage'
import AdminVerifyPage from './features/admin/AdminVerifyPage'
import ProtectedRoute from './routes/ProtectedRoute'
import ComingSoon from './components/ComingSoon'

// Wraps a protected page so we don't repeat the guard on every route.
function Protected({ children }) {
  return <ProtectedRoute>{children}</ProtectedRoute>
}

export default function App() {
  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route path="/register" element={<RegisterPage />} />

      <Route path="/dashboard" element={<Protected><DashboardPage /></Protected>} />

      {/* Placeholders — replaced by real screens as we build each phase. */}
      <Route path="/diagnose" element={<Protected><DiagnosisPage /></Protected>} />
      <Route path="/search" element={<Protected><SearchPage /></Protected>} />
      <Route path="/bookings" element={<Protected><BookingsPage /></Protected>} />
      <Route path="/worker/profile" element={<Protected><WorkerProfilePage /></Protected>} />
      <Route path="/admin/verify" element={<Protected><AdminVerifyPage /></Protected>} />

      <Route path="*" element={<Navigate to="/dashboard" replace />} />
    </Routes>
  )
}
