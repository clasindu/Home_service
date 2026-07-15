import { useState, useEffect, useCallback } from 'react'
import { useSearchParams, useNavigate } from 'react-router-dom'
import { CalendarClock, MapPin, Loader2, CheckCircle2, XCircle, CalendarPlus } from 'lucide-react'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'
import StatusBadge from './StatusBadge'

const DEFAULT_LAT = 6.9271
const DEFAULT_LNG = 79.8612

/**
 * Bookings hub. If arrived from search with ?worker=&category=, shows a
 * create-booking form at the top. Always lists the user's existing bookings
 * below, with cancel/complete actions where the booking state allows.
 */
export default function BookingsPage() {
  const [searchParams] = useSearchParams()
  const navigate = useNavigate()

  const preWorkerId = searchParams.get('worker')
  const preCategoryId = searchParams.get('category')

  const [bookings, setBookings] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  const loadBookings = useCallback(async () => {
    setLoading(true)
    try {
      const { data } = await api.get('/bookings')
      setBookings(data)
    } catch {
      setError('Could not load your bookings.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { loadBookings() }, [loadBookings])

  return (
    <div className="min-h-screen bg-slate-50">
      <TopNav />
      <main className="mx-auto max-w-3xl px-4 py-8">
        <div className="mb-6 flex items-center gap-3">
          <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky text-white">
            <CalendarClock size={22} />
          </span>
          <div>
            <h1 className="font-display text-xl font-bold text-ink_black">My Bookings</h1>
            <p className="text-sm text-ink_black-600">Request a visit and track its progress.</p>
          </div>
        </div>

        {/* Create-booking form (only when arriving from search with a worker) */}
        {preWorkerId && preCategoryId && (
          <CreateBookingForm
            workerId={preWorkerId}
            categoryId={preCategoryId}
            onCreated={() => { loadBookings(); navigate('/bookings', { replace: true }) }}
          />
        )}

        {error && <p className="mb-4 text-sm text-red-600">{error}</p>}

        {loading ? (
          <div className="flex items-center justify-center gap-2 py-16 text-ink_black-600">
            <Loader2 size={20} className="animate-spin" /> Loading bookings…
          </div>
        ) : bookings && bookings.length > 0 ? (
          <div className="space-y-4">
            {bookings.map((b) => (
              <BookingCard key={b.id} booking={b} onChanged={loadBookings} />
            ))}
          </div>
        ) : (
          <div className="flex flex-col items-center rounded-2xl border border-slate-200 bg-white py-16 text-center">
            <span className="flex h-14 w-14 items-center justify-center rounded-2xl bg-slate-100 text-slate-400">
              <CalendarClock size={26} />
            </span>
            <h3 className="mt-4 font-display text-lg font-bold text-ink_black">No bookings yet</h3>
            <p className="mt-1 max-w-sm text-sm text-ink_black-600">
              Diagnose an issue or find a professional to make your first booking.
            </p>
            <button
              onClick={() => navigate('/search')}
              className="mt-6 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5"
            >
              Find a professional
            </button>
          </div>
        )}
      </main>
    </div>
  )
}

function CreateBookingForm({ workerId, categoryId, onCreated }) {
  const [address, setAddress] = useState('')
  const [description, setDescription] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')

  const submit = async () => {
    if (!address.trim()) { setError('Please enter your address.'); return }
    setError('')
    setSubmitting(true)
    try {
      await api.post('/bookings', {
        categoryId: Number(categoryId),
        workerId,
        description: description.trim() || null,
        address: address.trim(),
        latitude: DEFAULT_LAT,
        longitude: DEFAULT_LNG,
      })
      onCreated()
    } catch {
      setError('Could not create the booking. Please try again.')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="mb-8 rounded-2xl border-2 border-fresh_sky/30 bg-fresh_sky/5 p-5">
      <div className="mb-3 flex items-center gap-2">
        <CalendarPlus size={18} className="text-steel_blue" />
        <h2 className="font-display text-base font-bold text-ink_black">New booking request</h2>
      </div>
      <div className="space-y-4">
        <label className="block">
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Your address</span>
          <input
            value={address}
            onChange={(e) => setAddress(e.target.value)}
            placeholder="House no, street, city"
            className="w-full rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black placeholder:text-slate-400 focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
          />
        </label>
        <label className="block">
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">Describe the problem (optional)</span>
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            rows={2}
            placeholder="e.g. Leaking pipe under the kitchen sink"
            className="w-full resize-none rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black placeholder:text-slate-400 focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
          />
        </label>
        {error && <p className="text-sm text-red-600">{error}</p>}
        <button
          onClick={submit}
          disabled={submitting}
          className="rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-6 py-3 font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:opacity-60"
        >
          {submitting ? 'Requesting…' : 'Request booking'}
        </button>
      </div>
    </div>
  )
}

function BookingCard({ booking, onChanged }) {
  const [busy, setBusy] = useState(false)

  const act = async (action) => {
    setBusy(true)
    try {
      await api.patch(`/bookings/${booking.id}/${action}`)
      onChanged()
    } catch {
      // keep it simple; a fuller UI would surface the specific error
    } finally {
      setBusy(false)
    }
  }

  const canCancel = ['PENDING', 'CONFIRMED', 'EN_ROUTE', 'IN_PROGRESS'].includes(booking.status)

  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5">
      <div className="mb-2 flex items-center justify-between">
        <h3 className="font-display text-base font-bold text-ink_black">
          {booking.categoryName
            ? booking.categoryName.charAt(0) + booking.categoryName.slice(1).toLowerCase().replace('_', ' ')
            : 'Service'} booking
        </h3>
        <StatusBadge status={booking.status} />
      </div>

      {booking.workerName && (
        <p className="text-sm text-ink_black-600">Professional: <span className="font-medium text-ink_black">{booking.workerName}</span></p>
      )}
      {booking.address && (
        <p className="mt-1 flex items-center gap-1 text-sm text-ink_black-600">
          <MapPin size={14} /> {booking.address}
        </p>
      )}
      {booking.description && (
        <p className="mt-2 text-sm text-ink_black-600">{booking.description}</p>
      )}
      {booking.cancellationReason && (
        <p className="mt-2 text-sm text-red-600">Cancelled: {booking.cancellationReason}</p>
      )}

      {canCancel && (
        <div className="mt-4 flex gap-2">
          <button
            onClick={() => act('cancel')}
            disabled={busy}
            className="inline-flex items-center gap-1 rounded-lg border border-slate-200 px-4 py-2 text-sm font-medium text-ink_black transition hover:bg-slate-50 disabled:opacity-50"
          >
            <XCircle size={15} /> Cancel
          </button>
          {booking.status === 'IN_PROGRESS' && (
            <button
              onClick={() => act('complete')}
              disabled={busy}
              className="inline-flex items-center gap-1 rounded-lg bg-emerald-600 px-4 py-2 text-sm font-medium text-white transition hover:bg-emerald-700 disabled:opacity-50"
            >
              <CheckCircle2 size={15} /> Mark complete
            </button>
          )}
        </div>
      )}
    </div>
  )
}
