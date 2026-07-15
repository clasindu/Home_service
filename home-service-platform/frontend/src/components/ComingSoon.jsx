import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Hammer } from 'lucide-react'
import TopNav from '../components/TopNav'

/**
 * Placeholder for features not built yet, so dashboard links never dead-end.
 * Each of these gets replaced by its real screen as we build the remaining phases.
 */
export default function ComingSoon({ title }) {
  const navigate = useNavigate()
  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />
      <main className="mx-auto flex max-w-3xl flex-col items-center px-6 py-24 text-center">
        <span className="flex h-16 w-16 items-center justify-center rounded-2xl bg-fresh_sky/10 text-steel_blue">
          <Hammer size={28} />
        </span>
        <h1 className="mt-6 font-display text-2xl font-bold text-ink_black">{title}</h1>
        <p className="mt-2 max-w-md text-ink_black-600">
          This screen is coming next. The backend for it is ready — we’re building the interface now.
        </p>
        <button
          onClick={() => navigate('/dashboard')}
          className="mt-8 inline-flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-5 py-3 text-sm font-semibold text-ink_black transition hover:bg-slate-50"
        >
          <ArrowLeft size={16} /> Back to dashboard
        </button>
      </main>
    </div>
  )
}
