/**
 * Colored badge for a diagnosis severity. Colors escalate from calm blue (LOW)
 * to red (CRITICAL), so urgency is legible at a glance.
 */
const STYLES = {
  LOW: 'bg-fresh_sky/10 text-steel_blue',
  MEDIUM: 'bg-amber-100 text-amber-700',
  HIGH: 'bg-orange-100 text-orange-700',
  CRITICAL: 'bg-red-100 text-red-700',
}

export default function SeverityBadge({ severity }) {
  if (!severity) return null
  const style = STYLES[severity] || STYLES.LOW
  return (
    <span className={`inline-flex items-center rounded-full px-3 py-1 text-xs font-semibold ${style}`}>
      {severity} severity
    </span>
  )
}
