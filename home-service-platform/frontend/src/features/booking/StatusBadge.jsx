/**
 * Colored pill for a booking status, so state is scannable at a glance.
 */
const STYLES = {
  PENDING: 'bg-amber-100 text-amber-700',
  CONFIRMED: 'bg-fresh_sky/10 text-steel_blue',
  EN_ROUTE: 'bg-fresh_sky/10 text-steel_blue',
  IN_PROGRESS: 'bg-baltic_blue/10 text-baltic_blue',
  COMPLETED: 'bg-emerald-100 text-emerald-700',
  CANCELLED: 'bg-slate-200 text-slate-600',
  DISPUTED: 'bg-red-100 text-red-700',
}

const LABELS = {
  PENDING: 'Pending',
  CONFIRMED: 'Confirmed',
  EN_ROUTE: 'On the way',
  IN_PROGRESS: 'In progress',
  COMPLETED: 'Completed',
  CANCELLED: 'Cancelled',
  DISPUTED: 'Disputed',
}

export default function StatusBadge({ status }) {
  const style = STYLES[status] || STYLES.PENDING
  return (
    <span className={`inline-flex items-center rounded-full px-3 py-1 text-xs font-semibold ${style}`}>
      {LABELS[status] || status}
    </span>
  )
}
