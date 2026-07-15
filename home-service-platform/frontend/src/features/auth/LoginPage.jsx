import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import AuthLayout from '../../components/AuthLayout'
import TextField from '../../components/TextField'
import PrimaryButton from '../../components/PrimaryButton'

export default function LoginPage() {
  const { login } = useAuth()
  const navigate = useNavigate()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [submitting, setSubmitting] = useState(false)

  const onSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setSubmitting(true)
    try {
      await login(email, password)
      navigate('/dashboard')
    } catch (err) {
      setError(err.response?.data?.detail || 'Those details didn’t match. Try again.')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <AuthLayout>
      <h1 className="font-display text-3xl font-bold tracking-tight text-ink_black">
        Welcome back
      </h1>
      <p className="mt-2 text-ink_black-600">
        Sign in to manage your bookings and diagnoses.
      </p>

      {error && (
        <div className="mt-6 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      )}

      <form onSubmit={onSubmit} className="mt-8 space-y-5">
        <TextField
          label="Email"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="you@example.com"
          autoComplete="email"
        />
        <TextField
          label="Password"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="••••••••"
          autoComplete="current-password"
        />
        <PrimaryButton type="submit" disabled={submitting}>
          {submitting ? 'Signing in…' : 'Sign in'}
        </PrimaryButton>
      </form>

      <p className="mt-8 text-sm text-ink_black-600">
        New here?{' '}
        <Link to="/register" className="font-semibold text-steel_blue hover:text-fresh_sky">
          Create an account
        </Link>
      </p>
    </AuthLayout>
  )
}
