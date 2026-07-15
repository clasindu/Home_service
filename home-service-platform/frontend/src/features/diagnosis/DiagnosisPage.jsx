import { useState, useRef, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Send, Sparkles, ShieldAlert, Wrench, Lightbulb, ArrowRight } from 'lucide-react'
import api from '../../lib/api'
import TopNav from '../../components/TopNav'
import SeverityBadge from './SeverityBadge'

/**
 * Conversational AI diagnosis. Starts a conversation on mount, streams the
 * back-and-forth as chat bubbles, and when the agent marks the diagnosis
 * complete, shows a result card (severity + DIY guidance or a professional
 * referral) with a button to find a pro.
 */
export default function DiagnosisPage() {
  const navigate = useNavigate()
  const [conversationId, setConversationId] = useState(null)
  const [messages, setMessages] = useState([]) // {sender: 'USER'|'AGENT', text}
  const [input, setInput] = useState('')
  const [sending, setSending] = useState(false)
  const [result, setResult] = useState(null) // final AgentReplyDto when complete
  const [error, setError] = useState('')
  const scrollRef = useRef(null)

  // Start a conversation as soon as the page opens.
  useEffect(() => {
    ;(async () => {
      try {
        const { data } = await api.post('/ai/conversations')
        setConversationId(data.conversationId)
        setMessages([{
          sender: 'AGENT',
          text: "Hi! Tell me what's going wrong at home and I'll help figure it out. Describe the problem in your own words.",
        }])
      } catch {
        setError('Could not start a diagnosis session. Please try again.')
      }
    })()
  }, [])

  // Auto-scroll to the newest message.
  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' })
  }, [messages, sending])

  const send = async () => {
    const text = input.trim()
    if (!text || !conversationId || sending) return

    setInput('')
    setError('')
    setMessages((m) => [...m, { sender: 'USER', text }])
    setSending(true)

    try {
      const { data } = await api.post(`/ai/conversations/${conversationId}/messages`, { message: text })
      setMessages((m) => [...m, { sender: 'AGENT', text: data.reply }])
      if (data.diagnosisComplete) {
        setResult(data)
      }
    } catch {
      setError('The assistant had trouble responding. Try sending that again.')
    } finally {
      setSending(false)
    }
  }

  const onKeyDown = (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      send()
    }
  }

  return (
    <div className="flex min-h-screen flex-col bg-slate-50">
      <TopNav />

      <main className="mx-auto flex w-full max-w-3xl flex-1 flex-col px-4 py-6">
        {/* Header */}
        <div className="mb-4 flex items-center gap-3">
          <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky text-white">
            <Sparkles size={22} />
          </span>
          <div>
            <h1 className="font-display text-xl font-bold text-ink_black">AI Diagnosis</h1>
            <p className="text-sm text-ink_black-600">Describe your problem and get a quick assessment.</p>
          </div>
        </div>

        {/* Chat area */}
        <div
          ref={scrollRef}
          className="flex-1 space-y-4 overflow-y-auto rounded-2xl border border-slate-200 bg-white p-4 sm:p-6"
          style={{ minHeight: '50vh', maxHeight: '60vh' }}
        >
          {messages.map((m, i) => (
            <MessageBubble key={i} sender={m.sender} text={m.text} />
          ))}

          {sending && (
            <div className="flex items-center gap-2 text-sm text-ink_black-600">
              <span className="flex gap-1">
                <Dot /> <Dot delay="150ms" /> <Dot delay="300ms" />
              </span>
              Thinking…
            </div>
          )}

          {result && <ResultCard result={result} onFindPro={() => navigate(`/search?categoryName=${encodeURIComponent(result.categoryName || '')}`)} />}
        </div>

        {error && <p className="mt-3 text-sm text-red-600">{error}</p>}

        {/* Input */}
        <div className="mt-4 flex items-end gap-2">
          <textarea
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={onKeyDown}
            rows={1}
            placeholder="e.g. My kitchen sink is leaking under the cabinet"
            className="max-h-40 flex-1 resize-none rounded-xl border border-slate-200 bg-white px-4 py-3 text-ink_black
                       placeholder:text-slate-400 focus:border-fresh_sky focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
          />
          <button
            onClick={send}
            disabled={sending || !input.trim()}
            className="flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky text-white
                       shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5 disabled:translate-y-0 disabled:opacity-50"
            aria-label="Send message"
          >
            <Send size={20} />
          </button>
        </div>
      </main>
    </div>
  )
}

function MessageBubble({ sender, text }) {
  const isUser = sender === 'USER'
  return (
    <div className={`flex ${isUser ? 'justify-end' : 'justify-start'}`}>
      <div
        className={
          'max-w-[80%] rounded-2xl px-4 py-3 text-sm leading-relaxed ' +
          (isUser
            ? 'bg-gradient-to-r from-steel_blue to-fresh_sky text-white'
            : 'bg-slate-100 text-ink_black')
        }
      >
        {text}
      </div>
    </div>
  )
}

function ResultCard({ result, onFindPro }) {
  const professional = result.requiresProfessional
  return (
    <div className="rounded-2xl border-2 border-fresh_sky/30 bg-fresh_sky/5 p-5">
      <div className="mb-3 flex flex-wrap items-center gap-2">
        <span className="font-display text-base font-bold text-ink_black">Diagnosis</span>
        {result.categoryName && (
          <span className="rounded-full bg-white px-3 py-1 text-xs font-semibold text-baltic_blue">
            {result.categoryName}
          </span>
        )}
        <SeverityBadge severity={result.severity} />
      </div>

      {professional ? (
        <div className="flex items-start gap-3">
          <ShieldAlert size={20} className="mt-0.5 shrink-0 text-red-600" />
          <p className="text-sm text-ink_black">
            This needs a qualified professional. Book a verified local pro to handle it safely.
          </p>
        </div>
      ) : (
        <div className="flex items-start gap-3">
          <Lightbulb size={20} className="mt-0.5 shrink-0 text-steel_blue" />
          <div className="text-sm text-ink_black">
            <p className="mb-1 font-semibold">You may be able to fix this yourself:</p>
            <p className="whitespace-pre-line">{result.diyRecommendation || 'Follow the guidance above.'}</p>
          </div>
        </div>
      )}

      <button
        onClick={onFindPro}
        className="mt-4 inline-flex items-center gap-2 rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-5 py-3
                   font-display text-sm font-semibold text-white shadow-lg shadow-fresh_sky/25 transition hover:-translate-y-0.5"
      >
        <Wrench size={16} /> Find a professional <ArrowRight size={16} />
      </button>
    </div>
  )
}

function Dot({ delay = '0ms' }) {
  return (
    <span
      className="inline-block h-1.5 w-1.5 animate-bounce rounded-full bg-steel_blue"
      style={{ animationDelay: delay }}
    />
  )
}
