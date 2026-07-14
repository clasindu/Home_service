import { createContext, useContext, useEffect, useState, useCallback } from 'react'
import api, { setAccessToken, registerRefreshHandler } from '../lib/api'

const AuthContext = createContext(null)

const REFRESH_KEY = 'hs_refresh_token'

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null)
  const [loading, setLoading] = useState(true)

  const applyAuth = useCallback((data) => {
    setAccessToken(data.accessToken)
    localStorage.setItem(REFRESH_KEY, data.refreshToken)
    setUser({ id: data.userId, fullName: data.fullName, role: data.role })
  }, [])

  const clearAuth = useCallback(() => {
    setAccessToken(null)
    localStorage.removeItem(REFRESH_KEY)
    setUser(null)
  }, [])

  const refresh = useCallback(async () => {
    const refreshToken = localStorage.getItem(REFRESH_KEY)
    if (!refreshToken) return null
    const { data } = await api.post('/auth/refresh', { refreshToken })
    applyAuth(data)
    return data.accessToken
  }, [applyAuth])

  // Register the refresh handler so the axios interceptor can call it on 401s.
  useEffect(() => {
    registerRefreshHandler(refresh)
  }, [refresh])

  // On first load, try to restore a session from a stored refresh token.
  useEffect(() => {
    ;(async () => {
      try {
        const token = await refresh()
        if (token) {
          const { data } = await api.get('/users/me')
          setUser({ id: data.id, fullName: data.fullName, role: data.role })
        }
      } catch {
        clearAuth()
      } finally {
        setLoading(false)
      }
    })()
  }, [refresh, clearAuth])

  const login = async (email, password) => {
    const { data } = await api.post('/auth/login', { email, password })
    applyAuth(data)
  }

  const register = async (payload) => {
    const { data } = await api.post('/auth/register', payload)
    applyAuth(data)
  }

  const logout = async () => {
    const refreshToken = localStorage.getItem(REFRESH_KEY)
    try {
      if (refreshToken) await api.post('/auth/logout', { refreshToken })
    } finally {
      clearAuth()
    }
  }

  return (
    <AuthContext.Provider value={{ user, loading, login, register, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

// eslint-disable-next-line react-refresh/only-export-components
export const useAuth = () => {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth must be used within AuthProvider')
  return ctx
}
