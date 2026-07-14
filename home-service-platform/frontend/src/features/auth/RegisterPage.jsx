import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'

export default function RegisterPage() {
  const { register } = useAuth()
  const navigate = useNavigate()
  const [form, setForm] = useState({
    fullName: '',
    email: '',
    password: '',
    phone: '',
    role: 'HOMEOWNER',
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
      setError(err.response?.data?.detail || 'Registration failed')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="w-full max-w-sm bg-white p-8 rounded-xl shadow">
        <h1 className="text-2xl font-semibold mb-6">Create account</h1>
        {error && <p className="mb-4 text-sm text-red-600">{error}</p>}
        <div className="space-y-4">
          <input className="w-full border rounded px-3 py-2" placeholder="Full name"
            value={form.fullName} onChange={update('fullName')} />
          <input className="w-full border rounded px-3 py-2" type="email" placeholder="Email"
            value={form.email} onChange={update('email')} />
          <input className="w-full border rounded px-3 py-2" type="password"
            placeholder="Password (min 8 chars)" value={form.password} onChange={update('password')} />
          <input className="w-full border rounded px-3 py-2" placeholder="Phone (optional)"
            value={form.phone} onChange={update('phone')} />
          <select className="w-full border rounded px-3 py-2" value={form.role} onChange={update('role')}>
            <option value="HOMEOWNER">Homeowner</option>
            <option value="WORKER">Worker</option>
          </select>
          <button onClick={onSubmit} disabled={submitting}
            className="w-full bg-blue-600 text-white rounded py-2 disabled:opacity-50">
            {submitting ? 'Creating…' : 'Register'}
          </button>
        </div>
        <p className="mt-4 text-sm text-gray-600">
          Already have an account?{' '}
          <Link className="text-blue-600" to="/login">Sign in</Link>
        </p>
      </div>
    </div>
  )
}
