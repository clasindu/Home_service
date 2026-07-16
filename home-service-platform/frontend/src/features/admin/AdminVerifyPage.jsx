import { useState, useEffect, useCallback } from 'react'
import { ShieldCheck, Loader2, CheckCircle2, UserCheck, Wrench } from 'lucide-react'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'

/**
 * Admin: worker verification queue. Lists workers awaiting verification and lets
 * an admin approve them with one click. Approving flips is_verified=true, after
 * which the worker starts appearing in customer searches. This is the trust
 * gate of the marketplace: register → admin verifies → discoverable.
 */
export default function AdminVerifyPage() {
  const [pending, setPending] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [verifyingId, setVerifyingId] = useState(null)

  const load = useCallback(async () => {
    setLoading(true)
    try {
      const { data } = await api.get('/admin/workers/pending')
      setPending(data)
    } catch {
      setError('Could not load pending workers. Make sure you are logged in as an admin.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { load() }, [load])

  const verify = async (id) => {
    setVerifyingId(id)
    try {
      await api.patch(`/admin/workers/${id}/verify`)
      setPending((list) => list.filter((w) => w.id !== id))
    } catch {
      setError('Verification failed. Please try again.')
    } finally {
      setVerifyingId(null)
    }
  }

  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />
      <main className="mx-auto max-w-3xl px-4 py-8">
        <div className="mb-6 flex items-center gap-3">
          <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky text-white">
            <ShieldCheck size={22} />
          </span>
          <div>
            <h1 className="font-display text-xl font-bold text-ink_black">Worker Verification</h1>
            <p className="text-sm text-ink_black-600">Approve workers so they appear in customer searches.</p>
          </div>
        </div>

        {error && <p className="mb-4 text-sm text-red-600">{error}</p>}

        {loading ? (
          <div className="flex items-center justify-center gap-2 py-16 text-ink_black-600">
            <Loader2 size={20} className="animate-spin" /> Loading…
          </div>
        ) : pending && pending.length > 0 ? (
          <div className="space-y-4">
            <p className="text-sm text-ink_black-600">{pending.length} worker{pending.length > 1 ? 's' : ''} awaiting verification</p>
            {pending.map((w) => (
              <div key={w.id} className="rounded-2xl border border-slate-200 bg-white p-5">
                <div className="flex items-start justify-between gap-4">
                  <div className="flex-1">
                    <h3 className="font-display text-lg font-bold text-ink_black">{w.fullName}</h3>
                    <p className="text-sm text-ink_black-600">{w.email}</p>
                    {w.bio && <p className="mt-2 text-sm text-ink_black-600">{w.bio}</p>}
                    <div className="mt-3 flex flex-wrap items-center gap-2">
                      {w.yearsExperience != null && (
                        <span className="rounded-full bg-slate-100 px-3 py-1 text-xs font-medium text-ink_black-600">
                          {w.yearsExperience} yrs experience
                        </span>
                      )}
                      {w.hourlyRate != null && (
                        <span className="rounded-full bg-slate-100 px-3 py-1 text-xs font-medium text-ink_black-600">
                          Rs {Number(w.hourlyRate).toFixed(0)}/hr
                        </span>
                      )}
                      {w.skills && w.skills.map((s) => (
                        <span key={s} className="inline-flex items-center gap-1 rounded-full bg-fresh_sky/10 px-3 py-1 text-xs font-medium text-steel_blue">
                          <Wrench size={11} /> {s.charAt(0) + s.slice(1).toLowerCase().replace('_', ' ')}
                        </span>
                      ))}
                    </div>
                  </div>
                  <button
                    onClick={() => verify(w.id)}
                    disabled={verifyingId === w.id}
                    className="inline-flex shrink-0 items-center gap-2 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:opacity-60"
                  >
                    {verifyingId === w.id
                      ? <Loader2 size={16} className="animate-spin" />
                      : <><UserCheck size={16} /> Verify</>}
                  </button>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="flex flex-col items-center rounded-2xl border border-slate-200 bg-white py-16 text-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-2xl bg-emerald-100 text-emerald-600">
              <CheckCircle2 size={26} />
            </span>
            <h3 className="mt-4 font-display text-lg font-bold text-ink_black">All caught up</h3>
            <p className="mt-1 max-w-sm text-sm text-ink_black-600">
              There are no workers awaiting verification right now.
            </p>
          </div>
        )}
      </main>
    </div>
  )
}
