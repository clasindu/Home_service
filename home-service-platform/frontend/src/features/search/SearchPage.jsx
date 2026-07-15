import { useState, useEffect, useCallback } from 'react'
import { useSearchParams, useNavigate } from 'react-router-dom'
import { Search, MapPin, Wrench, Loader2, UserX, Star } from 'lucide-react'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'
import RatingStars from './RatingStars'

/**
 * Find a Professional. Reads an optional ?category= from the diagnosis hand-off,
 * lets the user pick a category and set a search radius, then calls the ranked
 * worker-search backend and renders result cards. Uses the browser's location
 * when available, falling back to a default (Colombo) so search still works.
 */
const DEFAULT_LAT = 6.9271   // Colombo fallback
const DEFAULT_LNG = 79.8612

export default function SearchPage() {
  const [searchParams] = useSearchParams()
  const navigate = useNavigate()

  const [categories, setCategories] = useState([])
  const [categoryId, setCategoryId] = useState(searchParams.get('category') || '')
  const [radiusKm, setRadiusKm] = useState(25)
  const [coords, setCoords] = useState({ lat: DEFAULT_LAT, lng: DEFAULT_LNG })
  const [results, setResults] = useState(null) // null = not searched yet
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  // Load category list for the dropdown.
  useEffect(() => {
    api.get('/categories')
      .then(({ data }) => setCategories(data))
      .catch(() => setError('Could not load service categories.'))
  }, [])

  // If arriving from the diagnosis hand-off with a category NAME (e.g. PLUMBING),
  // resolve it to the matching id once categories are loaded.
  useEffect(() => {
    const name = searchParams.get('categoryName')
    if (name && categories.length && !categoryId) {
      const match = categories.find((c) => c.name.toUpperCase() === name.toUpperCase())
      if (match) setCategoryId(String(match.id))
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [categories])

  // Try to get the user's real location (non-blocking).
  useEffect(() => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (pos) => setCoords({ lat: pos.coords.latitude, lng: pos.coords.longitude }),
        () => {}, // permission denied -> keep fallback
        { timeout: 5000 },
      )
    }
  }, [])

  const runSearch = useCallback(async () => {
    if (!categoryId) {
      setError('Please choose a service category first.')
      return
    }
    setError('')
    setLoading(true)
    try {
      const { data } = await api.get('/workers/search', {
        params: { category: categoryId, lat: coords.lat, lng: coords.lng, radiusKm },
      })
      setResults(data)
    } catch {
      setError('Search failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }, [categoryId, coords, radiusKm])

  // If arriving from the diagnosis hand-off, auto-search once the category id resolves.
  useEffect(() => {
    if ((searchParams.get('category') || searchParams.get('categoryName')) && categoryId) {
      runSearch()
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [categoryId])

  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />

      <main className="mx-auto max-w-4xl px-4 py-8">
        {/* Header */}
        <div className="mb-6 flex items-center gap-3">
          <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky text-white">
            <Search size={22} />
          </span>
          <div>
            <h1 className="font-display text-xl font-bold text-ink_black">Find a Professional</h1>
            <p className="text-sm text-ink_black-600">Verified, nearby pros ranked by rating and distance.</p>
          </div>
        </div>

        {/* Search controls */}
        <div className="mb-6 rounded-2xl border border-slate-200 bg-white p-5">
          <div className="grid gap-4 sm:grid-cols-[1fr_auto_auto]">
            <label className="block">
              <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Service</span>
              <select
                value={categoryId}
                onChange={(e) => setCategoryId(e.target.value)}
                className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
              >
                <option value="">Choose a service…</option>
                {categories.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name.charAt(0) + c.name.slice(1).toLowerCase().replace('_', ' ')}
                  </option>
                ))}
              </select>
            </label>

            <label className="block">
              <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Within</span>
              <select
                value={radiusKm}
                onChange={(e) => setRadiusKm(Number(e.target.value))}
                className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
              >
                {[5, 10, 25, 50, 100].map((r) => (
                  <option key={r} value={r}>{r} km</option>
                ))}
              </select>
            </label>

            <div className="flex items-end">
              <button
                onClick={runSearch}
                disabled={loading}
                className="w-full rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-6 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:translate-y-0 disabled:opacity-60 sm:w-auto"
              >
                {loading ? <Loader2 size={18} className="animate-spin" /> : 'Search'}
              </button>
            </div>
          </div>
          <p className="mt-3 flex items-center gap-1 text-xs text-ink_black-600">
            <MapPin size={13} /> Searching near your current location.
          </p>
        </div>

        {error && <p className="mb-4 text-sm text-red-600">{error}</p>}

        {/* Results */}
        {loading && (
          <div className="flex items-center justify-center gap-2 py-16 text-ink_black-600">
            <Loader2 size={20} className="animate-spin" /> Finding professionals…
          </div>
        )}

        {!loading && results && results.length === 0 && (
          <div className="flex flex-col items-center rounded-2xl border border-slate-200 bg-white py-16 text-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-2xl bg-slate-100 text-slate-400">
              <UserX size={26} />
            </span>
            <h3 className="mt-4 font-display text-lg font-bold text-ink_black">No professionals found nearby</h3>
            <p className="mt-1 max-w-sm text-sm text-ink_black-600">
              Try widening your search radius, or check back soon as more pros join your area.
            </p>
          </div>
        )}

        {!loading && results && results.length > 0 && (
          <div className="space-y-4">
            <p className="text-sm text-ink_black-600">{results.length} professional{results.length > 1 ? 's' : ''} found</p>
            {results.map((w) => (
              <WorkerCard key={w.workerId} worker={w} onBook={() => navigate(`/bookings?worker=${w.workerId}&category=${categoryId}`)} />
            ))}
          </div>
        )}
      </main>
    </div>
  )
}

function WorkerCard({ worker, onBook }) {
  const initials = (worker.fullName || '?')
    .split(' ').map((w) => w[0]).slice(0, 2).join('').toUpperCase()

  return (
    <div className="flex flex-col gap-4 rounded-2xl border border-slate-200 bg-white p-5 transition hover:border-fresh_sky/40 hover:shadow-lg hover:shadow-fresh_sky/5 sm:flex-row sm:items-center">
      {/* Avatar */}
      <span className="flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl bg-baltic_blue text-lg font-semibold text-white">
        {initials}
      </span>

      {/* Info */}
      <div className="flex-1">
        <h3 className="font-display text-lg font-bold text-ink_black">{worker.fullName}</h3>
        <div className="mt-1 flex flex-wrap items-center gap-x-4 gap-y-1">
          <RatingStars rating={worker.avgRating} count={worker.ratingCount} />
          <span className="flex items-center gap-1 text-sm text-ink_black-600">
            <MapPin size={14} /> {worker.distanceKm} km away
          </span>
          {worker.hourlyRate != null && (
            <span className="text-sm font-medium text-ink_black">Rs {Number(worker.hourlyRate).toFixed(0)}/hr</span>
          )}
        </div>
      </div>

      {/* Action */}
      <button
        onClick={onBook}
        className="inline-flex items-center justify-center gap-2 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5"
      >
        <Wrench size={16} /> Book now
      </button>
    </div>
  )
}
