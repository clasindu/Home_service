/**
 * Labeled text input. Ink-black text, a soft grey border that turns sky-blue on
 * focus with a matching focus ring. One job: collect one value clearly.
 */
export default function TextField({ label, type = 'text', value, onChange, placeholder, autoComplete }) {
  return (
    <label className="block">
      <span className="mb-1.5 block text-sm font-medium text-ink_black-600">{label}</span>
      <input
        type={type}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        autoComplete={autoComplete}
        className="w-full rounded-xl border border-slate-200 bg-slate-50/60 px-4 py-3 text-ink_black
                   placeholder:text-slate-400 transition
                   focus:border-fresh_sky focus:bg-white focus:outline-none focus:ring-4 focus:ring-fresh_sky/15"
      />
    </label>
  )
}
