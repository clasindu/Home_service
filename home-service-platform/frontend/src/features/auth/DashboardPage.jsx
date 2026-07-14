import { useAuth } from '../../context/AuthContext'

// Placeholder authenticated landing page — confirms the protected route +
// token flow works end to end. Phase 3 features will live behind here.
export default function DashboardPage() {
  const { user, logout } = useAuth()
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-2xl mx-auto bg-white rounded-xl shadow p-8">
        <h1 className="text-2xl font-semibold mb-2">Welcome, {user?.fullName}</h1>
        <p className="text-gray-600 mb-6">Role: {user?.role}</p>
        <p className="text-sm text-gray-500 mb-6">
          You are authenticated. Phase 3 (worker marketplace &amp; booking) will be built here.
        </p>
        <button onClick={logout} className="bg-gray-800 text-white rounded px-4 py-2">
          Log out
        </button>
      </div>
    </div>
  )
}
