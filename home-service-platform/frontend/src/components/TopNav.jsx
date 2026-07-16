import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Home, Bell, LogOut, ChevronDown } from 'lucide-react'
import { useAuth } from '../context/AuthContext'

/**
 * Persistent top bar for authenticated pages: wordmark on the left, a
 * notification bell and a user menu on the right. The menu holds the logout
 * action so it isn't a naked button cluttering every page.
 */
export default function TopNav() {
  const { user, logout } = useAuth()
  const navigate = useNavigate()
  const [menuOpen, setMenuOpen] = useState(false)

  const initials = (user?.fullName || '?')
    .split(' ')
    .map((w) => w[0])
    .slice(0, 2)
    .join('')
    .toUpperCase()

  const onLogout = async () => {
    await logout()
    navigate('/login')
  }

  return (
    <header className="sticky top-0 z-20 border-b border-slate-200 bg-white/80 backdrop-blur">
      <div className="mx-auto flex h-16 max-w-6xl items-center justify-between px-6">
        <button onClick={() => navigate('/dashboard')} className="flex items-center gap-2">
          <span className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky">
            <Home size={18} color="white" strokeWidth={2.4} />
          </span>
          <span className="font-display text-lg text-ink_black" style={{ fontWeight: 800 }}>
            HomeServe
          </span>
        </button>

        <div className="flex items-center gap-2">
          {/* Notification bell */}
          <button
            className="relative flex h-10 w-10 items-center justify-center rounded-full text-ink_black-600 transition hover:bg-slate-100"
            aria-label="Notifications"
          >
            <Bell size={20} />
            <span className="absolute right-2.5 top-2.5 h-2 w-2 rounded-full bg-fresh_sky ring-2 ring-white" />
          </button>

          {/* User menu */}
          <div className="relative">
            <button
              onClick={() => setMenuOpen((v) => !v)}
              className="flex items-center gap-2 rounded-full py-1 pl-1 pr-2 transition hover:bg-slate-100"
            >
              <span className="flex h-8 w-8 items-center justify-center rounded-full bg-baltic_blue text-xs font-semibold text-white">
                {initials}
              </span>
              <span className="hidden text-sm font-medium text-ink_black sm:block">{user?.fullName}</span>
              <ChevronDown size={16} className="text-ink_black-600" />
            </button>

            {menuOpen && (
              <>
                <div className="fixed inset-0 z-10" onClick={() => setMenuOpen(false)} />
                <div className="absolute right-0 z-20 mt-2 w-48 rounded-xl border border-slate-200 bg-white py-1 shadow-lg">
                  <div className="border-b border-slate-100 px-4 py-2">
                    <p className="text-sm font-semibold text-ink_black">{user?.fullName}</p>
                    <p className="text-xs text-ink_black-600">{user?.role}</p>
                  </div>
                  <button
                    onClick={onLogout}
                    className="flex w-full items-center gap-2 px-4 py-2 text-sm text-ink_black transition hover:bg-slate-50"
                  >
                    <LogOut size={16} /> Log out
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </header>
  )
}
