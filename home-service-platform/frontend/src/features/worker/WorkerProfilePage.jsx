import { useState, useEffect, useCallback } from 'react'
import { Wrench, MapPin, Loader2, Plus, CheckCircle2, Star } from 'lucide-react'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'

/**
 * Worker self-service profile. A WORKER manages everything that makes them
 * discoverable: their bio/experience/rate/availability, the service categories
 * they offer (skills), and their service location. Without this a worker can't
 * appear in homeowner searches — this screen is what makes the marketplace
 * two-sided.
 */
export default function WorkerProfilePage() {
  const [profile, setProfile] = useState(null)
  const [categories, setCategories] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [savedMsg, setSavedMsg] = useState('')

  const load = useCallback(async () => {
    setLoading(true)
    try {
      const [{ data: prof }, { data: cats }] = await Promise.all([
        api.get('/workers/me'),
        api.get('/categories'),
      ])
      setProfile(prof)
      setCategories(cats)
    } catch {
      setError('Could not load your profile. Make sure you are logged in as a worker.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { load() }, [load])

  const flash = (msg) => { setSavedMsg(msg); setTimeout(() => setSavedMsg(''), 2500) }

  if (loading) {
    return (
      <div className="min-h-screen bg-slate-50">
        <TopNav />
        <div className="flex items-center justify-center gap-2 py-24 text-ink_black-600">
          <Loader2 size={20} className="animate-spin" /> Loading your profile…
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-slate-50">
        <TopNav />
        <p className="mx-auto max-w-2xl px-4 py-16 text-center text-red-600">{error}</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />
      <main className="mx-auto max-w-3xl px-4 py-8">
        <div className="mb-6 flex items-center gap-3">
          <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky text-white">
            <Wrench size={22} />
          </span>
          <div>
            <h1 className="font-display text-xl font-bold text-ink_black">My Profile</h1>
            <p className="text-sm text-ink_black-600">Set up your services so customers can find and book you.</p>
          </div>
        </div>

        {savedMsg && (
          <div className="mb-4 flex items-center gap-2 rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
            <CheckCircle2 size={16} /> {savedMsg}
          </div>
        )}

        {/* Verification notice */}
        {!profile.verified && (
          <div className="mb-6 rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
            Your account isn’t verified yet. You’ll appear in customer searches once an admin verifies you.
          </div>
        )}

        <ProfileDetails profile={profile} onSaved={(p) => { setProfile(p); flash('Profile updated') }} />
        <SkillsSection profile={profile} categories={categories} onSaved={(p) => { setProfile(p); flash('Skill added') }} />
        <LocationSection onSaved={() => flash('Location updated')} />
      </main>
    </div>
  )
}

function Card({ title, children }) {
  return (
    <section className="mb-6 rounded-2xl border border-slate-200 bg-white p-5">
      <h2 className="mb-4 font-display text-base font-bold text-ink_black">{title}</h2>
      {children}
    </section>
  )
}

function ProfileDetails({ profile, onSaved }) {
  const [bio, setBio] = useState(profile.bio || '')
  const [years, setYears] = useState(profile.yearsExperience || '')
  const [rate, setRate] = useState(profile.hourlyRate || '')
  const [available, setAvailable] = useState(profile.available)
  const [saving, setSaving] = useState(false)

  const save = async () => {
    setSaving(true)
    try {
      const { data } = await api.patch('/workers/me', {
        bio: bio || null,
        yearsExperience: years ? Number(years) : null,
        hourlyRate: rate ? Number(rate) : null,
        available,
      })
      onSaved(data)
    } finally {
      setSaving(false)
    }
  }

  return (
    <Card title="Details">
      <div className="space-y-4">
        <label className="block">
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Bio</span>
          <textarea
            value={bio}
            onChange={(e) => setBio(e.target.value)}
            rows={2}
            placeholder="Tell customers about your experience"
            className="w-full resize-none rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black placeholder:text-slate-400 focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
          />
        </label>
        <div className="grid gap-4 sm:grid-cols-2">
          <label className="block">
            <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Years of experience</span>
            <input
              type="number" min="0" value={years}
              onChange={(e) => setYears(e.target.value)}
              className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
            />
          </label>
          <label className="block">
            <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Hourly rate (Rs)</span>
            <input
              type="number" min="0" value={rate}
              onChange={(e) => setRate(e.target.value)}
              className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
            />
          </label>
        </div>
        <label className="flex items-center gap-3">
          <input
            type="checkbox" checked={available}
            onChange={(e) => setAvailable(e.target.checked)}
            className="h-5 w-5 rounded border-slate-300 text-steel_blue focus:ring-fresh_sky"
          />
          <span className="text-sm text-ink_black">Available for new jobs</span>
        </label>
        <button
          onClick={save} disabled={saving}
          className="rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-6 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:opacity-60"
        >
          {saving ? 'Saving…' : 'Save details'}
        </button>
      </div>
    </Card>
  )
}

function SkillsSection({ profile, categories, onSaved }) {
  const [categoryId, setCategoryId] = useState('')
  const [level, setLevel] = useState(3)
  const [saving, setSaving] = useState(false)
  const [err, setErr] = useState('')

  const existing = profile.skills || []
  const existingIds = new Set(existing.map((s) => s.categoryId))
  const addable = categories.filter((c) => !existingIds.has(c.id))

  const addSkill = async () => {
    if (!categoryId) { setErr('Choose a service to add.'); return }
    setErr('')
    setSaving(true)
    try {
      await api.post('/workers/me/skills', { categoryId: Number(categoryId), proficiencyLevel: Number(level) })
      const { data } = await api.get('/workers/me')
      onSaved(data)
      setCategoryId('')
    } catch {
      setErr('Could not add that skill.')
    } finally {
      setSaving(false)
    }
  }

  const pretty = (name) => name.charAt(0) + name.slice(1).toLowerCase().replace('_', ' ')

  return (
    <Card title="Services you offer">
      {existing.length > 0 ? (
        <div className="mb-4 flex flex-wrap gap-2">
          {existing.map((s) => (
            <span key={s.id} className="inline-flex items-center gap-1 rounded-full bg-fresh_sky/10 px-3 py-1.5 text-sm font-medium text-steel_blue">
              {pretty(s.categoryName)}
              <span className="ml-1 flex items-center gap-0.5 text-xs text-amber-500">
                {Array.from({ length: s.proficiencyLevel || 0 }).map((_, i) => (
                  <Star key={i} size={11} className="fill-amber-400 text-amber-400" />
                ))}
              </span>
            </span>
          ))}
        </div>
      ) : (
        <p className="mb-4 text-sm text-ink_black-600">You haven’t added any services yet. Add at least one so customers can find you.</p>
      )}

      {addable.length > 0 && (
        <div className="flex flex-wrap items-end gap-3">
          <label className="block flex-1">
            <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Add a service</span>
            <select
              value={categoryId} onChange={(e) => setCategoryId(e.target.value)}
              className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
            >
              <option value="">Choose…</option>
              {addable.map((c) => <option key={c.id} value={c.id}>{pretty(c.name)}</option>)}
            </select>
          </label>
          <label className="block">
            <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Skill level</span>
            <select
              value={level} onChange={(e) => setLevel(e.target.value)}
              className="rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
            >
              {[1, 2, 3, 4, 5].map((n) => <option key={n} value={n}>{n}</option>)}
            </select>
          </label>
          <button
            onClick={addSkill} disabled={saving}
            className="inline-flex items-center gap-1 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:opacity-60"
          >
            <Plus size={16} /> Add
          </button>
        </div>
      )}
      {err && <p className="mt-2 text-sm text-red-600">{err}</p>}
    </Card>
  )
}

function LocationSection({ onSaved }) {
  const [lat, setLat] = useState('')
  const [lng, setLng] = useState('')
  const [saving, setSaving] = useState(false)
  const [msg, setMsg] = useState('')

  const useMyLocation = () => {
    if (!navigator.geolocation) { setMsg('Geolocation not supported by your browser.'); return }
    navigator.geolocation.getCurrentPosition(
      (pos) => { setLat(pos.coords.latitude.toFixed(6)); setLng(pos.coords.longitude.toFixed(6)); setMsg('') },
      () => setMsg('Could not get your location. Enter it manually.'),
    )
  }

  const save = async () => {
    if (!lat || !lng) { setMsg('Set your location first.'); return }
    setSaving(true)
    try {
      await api.put('/workers/me/location', { latitude: Number(lat), longitude: Number(lng) })
      onSaved()
      setMsg('')
    } catch {
      setMsg('Could not save location.')
    } finally {
      setSaving(false)
    }
  }

  return (
    <Card title="Service location">
      <p className="mb-4 text-sm text-ink_black-600">
        Set where you work so you appear in nearby customer searches.
      </p>
      <div className="mb-4 flex flex-wrap items-end gap-3">
        <label className="block">
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Latitude</span>
          <input value={lat} onChange={(e) => setLat(e.target.value)} placeholder="6.9271"
            className="w-40 rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15" />
        </label>
        <label className="block">
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Longitude</span>
          <input value={lng} onChange={(e) => setLng(e.target.value)} placeholder="79.8612"
            className="w-40 rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15" />
        </label>
        <button onClick={useMyLocation}
          className="inline-flex items-center gap-1 rounded-xl border border-slate-200 px-4 py-3 text-sm font-medium text-ink_black transition hover:bg-slate-50">
          <MapPin size={16} /> Use my current location
        </button>
      </div>
      {msg && <p className="mb-3 text-sm text-ink_black-600">{msg}</p>}
      <button onClick={save} disabled={saving}
        className="rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-6 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:opacity-60">
        {saving ? 'Saving…' : 'Save location'}
      </button>
    </Card>
  )
}
