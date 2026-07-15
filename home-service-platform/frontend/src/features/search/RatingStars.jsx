import { Star } from 'lucide-react'

/**
 * Compact star rating: filled stars up to the rounded rating, plus the numeric
 * value and review count.
 */
export default function RatingStars({ rating, count }) {
  const value = rating ? Number(rating) : 0
  const rounded = Math.round(value)
  return (
    <span className="inline-flex items-center gap-1">
      {[1, 2, 3, 4, 5].map((i) => (
        <Star
          key={i}
          size={14}
          className={i <= rounded ? 'fill-amber-400 text-amber-400' : 'text-slate-300'}
        />
      ))}
      <span className="ml-1 text-sm font-medium text-ink_black">{value.toFixed(1)}</span>
      {count != null && <span className="text-xs text-ink_black-600">({count})</span>}
    </span>
  )
}
