import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import AuthLayout from '../../components/AuthLayout'
import TextField from '../../components/TextField'
import PrimaryButton from '../../components/PrimaryButton'

export default function RegisterPage() {
  const { register } = useAuth()
  const navigate = useNavigate()
  const [form, setForm] = useState({
    fullName: '', email: '', password: '', phone: '', role: 'HOMEOWNER',
  })
  const [error, setError] = useState('')
  const [submitting, setSubmitting] = useState(false)

  const update = (field) => (e) => setForm({ ...form, [field]: e.target.value })

  const onSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setSubmitting(true)
    try {
      await register(form)
      navigate('/dashboard')
    } catch (err) {
      setError(err.response?.data?.detail || 'We couldn’t create your account. Check your details and try again.')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <AuthLayout>
      <h1 className="font-display text-3xl font-bold tracking-tight text-ink_black">
        Create your account
      </h1>
      <p className="mt-2 text-ink_black-600">
        Get help with home repairs in minutes.
      </p>

      {error && (
        <div className="mt-6 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      )}

      <form onSubmit={onSubmit} className="mt-8 space-y-5">
        <TextField
          label="Full name"
          value={form.fullName}
          onChange={update('fullName')}
          placeholder="Amélie Laurent"
          autoComplete="name"
        />
        <TextField
          label="Email"
          type="email"
          value={form.email}
          onChange={update('email')}
          placeholder="you@example.com"
          autoComplete="email"
        />
        <TextField
          label="Password"
          type="password"
          value={form.password}
          onChange={update('password')}
          placeholder="At least 8 characters"
          autoComplete="new-password"
        />
        <TextField
          label="Phone (optional)"
          value={form.phone}
          onChange={update('phone')}
          placeholder="+94 7X XXX XXXX"
          autoComplete="tel"
        />

        {/* Role picker — homeowner vs professional */}
        <div>
          <span className="mb-1.5 block text-sm font-medium text-ink_black-600">I want to</span>
          <div className="grid grid-cols-2 gap-3">
            {[
              { value: 'HOMEOWNER', label: 'Hire help', hint: 'Book professionals' },
              { value: 'WORKER', label: 'Offer services', hint: 'Work as a pro' },
            ].map((opt) => {
              const active = form.role === opt.value
              return (
                <button
                  type="button"
                  key={opt.value}
                  onClick={() => setForm({ ...form, role: opt.value })}
                  className={
                    'rounded-xl border px-4 py-3 text-left transition ' +
                    (active
                      ? 'border-fresh_sky bg-fresh_sky/5 ring-2 ring-fresh_sky/20'
                      : 'border-slate-200 bg-white hover:border-slate-300')
                  }
                >
                  <span className="block text-sm font-semibold text-ink_black">{opt.label}</span>
                  <span className="block text-xs text-ink_black-600">{opt.hint}</span>
                </button>
              )
            })}
          </div>
        </div>

        <PrimaryButton type="submit" disabled={submitting}>
          {submitting ? 'Creating account…' : 'Create account'}
        </PrimaryButton>
      </form>

      <p className="mt-8 text-sm text-ink_black-600">
        Already have an account?{' '}
        <Link to="/login" className="font-semibold text-steel_blue hover:text-fresh_sky">
          Sign in
        </Link>
      </p>
    </AuthLayout>
  )
}
