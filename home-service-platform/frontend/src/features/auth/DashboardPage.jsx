import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Sparkles, Search, CalendarClock, Wrench, MapPin, Star, ArrowRight, ShieldCheck } from 'lucide-react'
import { useAuth } from '../../context/AuthContext'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'
import dashboardHero from '../../assets/dashboard-hero.jpg'

/**
 * Authenticated home base. A gradient hero greets the user, a quick-stats row
 * gives an at-a-glance summary, and role-aware feature cards route to the main
 * actions. Homeowners diagnose + find pros; workers manage their profile + jobs.
 */
export default function DashboardPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const isWorker = user?.role === 'WORKER'
  const isAdmin = user?.role === 'ADMIN'

  const firstName = (user?.fullName || '').split(' ')[0] || 'there'

  // Load real dashboard numbers from the user's bookings.
  const [counts, setCounts] = useState(null)
  const [workerRating, setWorkerRating] = useState(null)
  useEffect(() => {
    if (isAdmin) return
    api.get('/bookings')
      .then(({ data }) => {
        const active = data.filter((b) =>
          ['PENDING', 'CONFIRMED', 'EN_ROUTE', 'IN_PROGRESS'].includes(b.status)).length
        const completed = data.filter((b) => b.status === 'COMPLETED').length
        setCounts({ total: data.length, active, completed })
      })
      .catch(() => setCounts({ total: 0, active: 0, completed: 0 }))

    // Workers: fetch their profile to show their real rating.
    if (isWorker) {
      api.get('/workers/me')
        .then(({ data }) => setWorkerRating(data.avgRating))
        .catch(() => {})
    }
  }, [isAdmin, isWorker])

  const show = (n) => (counts == null ? '—' : String(n))

  const homeownerCards = [
    {
      title: 'Diagnose an issue',
      body: 'Describe a home problem and let our AI assistant assess it in minutes.',
      icon: Sparkles,
      accent: 'from-steel_blue to-fresh_sky',
      to: '/diagnose',
      cta: 'Start a diagnosis',
    },
    {
      title: 'Find a professional',
      body: 'Search verified, nearby pros by trade, rating, and availability.',
      icon: Search,
      accent: 'from-baltic_blue to-steel_blue',
      to: '/search',
      cta: 'Browse professionals',
    },
    {
      title: 'My bookings',
      body: 'Track upcoming visits and review past jobs.',
      icon: CalendarClock,
      accent: 'from-deep_space_blue to-baltic_blue',
      to: '/bookings',
      cta: 'View bookings',
    },
  ]

  const workerCards = [
    {
      title: 'My profile',
      body: 'Manage your skills, rates, and availability so customers can find you.',
      icon: Wrench,
      accent: 'from-steel_blue to-fresh_sky',
      to: '/worker/profile',
      cta: 'Edit profile',
    },
    {
      title: 'Job requests',
      body: 'Review and accept booking requests from nearby homeowners.',
      icon: CalendarClock,
      accent: 'from-baltic_blue to-steel_blue',
      to: '/bookings',
      cta: 'View requests',
    },
    {
      title: 'My location',
      body: 'Update your service location so you appear in local searches.',
      icon: MapPin,
      accent: 'from-deep_space_blue to-baltic_blue',
      to: '/worker/profile',
      cta: 'Set location',
    },
  ]

  const adminCards = [
    {
      title: 'Verify workers',
      body: 'Review and approve workers so they appear in customer searches.',
      icon: ShieldCheck,
      accent: 'from-steel_blue to-fresh_sky',
      to: '/admin/verify',
      cta: 'Open verification queue',
    },
  ]

  const cards = isAdmin ? adminCards : isWorker ? workerCards : homeownerCards

  const stats = isWorker
    ? [
        { label: 'Active requests', value: show(counts?.active), icon: CalendarClock },
        { label: 'Your rating', value: workerRating != null ? Number(workerRating).toFixed(1) : '—', icon: Star },
        { label: 'Jobs completed', value: show(counts?.completed), icon: Wrench },
      ]
    : [
        { label: 'Open bookings', value: show(counts?.active), icon: CalendarClock },
        { label: 'Total bookings', value: show(counts?.total), icon: Sparkles },
        { label: 'Completed', value: show(counts?.completed), icon: Star },
      ]

  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />

      <main className="mx-auto max-w-6xl px-6 py-8">
        {/* Hero banner */}
        <section className="relative overflow-hidden rounded-3xl border border-slate-200 bg-white">
          <div className="grid items-center gap-6 md:grid-cols-2">
            {/* Text side */}
            <div className="px-8 py-10 sm:px-10 md:py-12">
              <p className="text-sm font-semibold text-steel_blue">
                {isAdmin ? 'Admin dashboard' : isWorker ? 'Professional dashboard' : 'Welcome home'}
              </p>
              <h1 className="mt-2 font-display text-3xl font-bold text-ink_black sm:text-4xl">
                Hi {firstName} 👋
              </h1>
              <p className="mt-3 max-w-md text-ink_black-600">
                {isAdmin
                  ? 'Review workers awaiting verification to keep the marketplace trusted.'
                  : isWorker
                  ? 'Keep your profile sharp and respond to job requests to win more work.'
                  : 'Something need fixing? Start with a quick AI diagnosis, then book a trusted local pro.'}
              </p>
              {!isWorker && !isAdmin && (
                <button
                  onClick={() => navigate('/diagnose')}
                  className="mt-6 inline-flex items-center gap-2 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5"
                >
                  <Sparkles size={18} /> Diagnose an issue
                </button>
              )}
            </div>
            {/* Illustration side */}
            <div className="flex h-full items-center justify-center p-4">
              <img
                src={dashboardHero}
                alt="A home surrounded by service icons for plumbing, electrical, painting, and gardening"
                className="max-h-64 w-full object-contain"
              />
            </div>
          </div>
        </section>

        {/* Quick stats */}
        {!isAdmin && (
        <section className="mt-6 grid grid-cols-1 gap-4 sm:grid-cols-3">
          {stats.map((s) => {
            const Icon = s.icon
            return (
              <div key={s.label} className="flex items-center gap-4 rounded-2xl border border-slate-200 bg-white p-5">
                <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-fresh_sky/10 text-steel_blue">
                  <Icon size={20} />
                </span>
                <div>
                  <p className="text-2xl font-bold text-ink_black">{s.value}</p>
                  <p className="text-sm text-ink_black-600">{s.label}</p>
                </div>
              </div>
            )
          })}
        </section>
        )}

        {/* Feature cards */}
        <section className="mt-8">
          <h2 className="mb-4 font-display text-lg font-bold text-ink_black">
            {isAdmin ? 'Admin tools' : isWorker ? 'Manage your work' : 'What would you like to do?'}
          </h2>
          <div className="grid grid-cols-1 gap-5 md:grid-cols-3">
            {cards.map((c) => {
              const Icon = c.icon
              return (
                <button
                  key={c.title}
                  onClick={() => navigate(c.to)}
                  className="group flex flex-col rounded-2xl border border-slate-200 bg-white p-6 text-left transition hover:-translate-y-1 hover:border-fresh_sky/40 hover:shadow-xl hover:shadow-fresh_sky/5"
                >
                  <span className={`mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br ${c.accent} text-white`}>
                    <Icon size={22} />
                  </span>
                  <h3 className="font-display text-lg font-bold text-ink_black">{c.title}</h3>
                  <p className="mt-1 flex-1 text-sm text-ink_black-600">{c.body}</p>
                  <span className="mt-4 inline-flex items-center gap-1 text-sm font-semibold text-steel_blue transition group-hover:gap-2">
                    {c.cta} <ArrowRight size={16} />
                  </span>
                </button>
              )
            })}
          </div>
        </section>
      </main>
    </div>
  )
}
