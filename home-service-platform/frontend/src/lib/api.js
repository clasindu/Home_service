import axios from 'axios'

// Base API client. The Vite dev-server proxy (see vite.config.js) forwards
// /api calls to the Spring Boot backend on :8081.
const api = axios.create({
  baseURL: '/api/v1',
  headers: { 'Content-Type': 'application/json' },
})

// In-memory access token (kept out of localStorage to reduce XSS token theft;
// refresh token is what's persisted, see AuthContext).
let accessToken = null
export const setAccessToken = (token) => {
  accessToken = token
}

api.interceptors.request.use((config) => {
  if (accessToken) {
    config.headers.Authorization = `Bearer ${accessToken}`
  }
  return config
})

// On a 401, try one silent refresh, then retry the original request once.
let refreshHandler = null
export const registerRefreshHandler = (fn) => {
  refreshHandler = fn
}

api.interceptors.response.use(
  (res) => res,
  async (error) => {
    const original = error.config
    if (error.response?.status === 401 && !original._retry && refreshHandler) {
      original._retry = true
      try {
        const newToken = await refreshHandler()
        if (newToken) {
          original.headers.Authorization = `Bearer ${newToken}`
          return api(original)
        }
      } catch {
        // fall through to reject
      }
    }
    return Promise.reject(error)
  },
)

export default api
