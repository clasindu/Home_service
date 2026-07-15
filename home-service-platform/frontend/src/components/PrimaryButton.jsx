/**
 * Primary action button — the one bold element on the page. Steel-to-sky
 * gradient, lifts slightly on hover, dims while working.
 */
export default function PrimaryButton({ children, onClick, disabled, type = 'button' }) {
  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className="w-full rounded-xl bg-gradient-to-r from-steel_blue to-fresh_sky px-4 py-3
                 font-display text-base font-semibold text-white shadow-lg shadow-fresh_sky/25
                 transition hover:-translate-y-0.5 hover:shadow-xl hover:shadow-fresh_sky/30
                 focus:outline-none focus:ring-4 focus:ring-fresh_sky/30
                 disabled:translate-y-0 disabled:cursor-not-allowed disabled:opacity-60"
    >
      {children}
    </button>
  )
}
