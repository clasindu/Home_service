import { Navigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

// Guards routes that require authentication. While the session is being
// restored on first load we show a placeholder to avoid a flash-redirect to
// /login before the silent refresh completes.
export default function ProtectedRoute({ children }) {
  const { user, loading } = useAuth()
  if (loading) return <div className="p-8">Loading…</div>
  if (!user) return <Navigate to="/login" replace />
  return children
}
