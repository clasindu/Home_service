import heroImg from '../assets/auth-hero.jpg'

/**
 * Split-screen shell for the auth pages: form on the left, the homeowner-meets-
 * technician photo on the right. On small screens the photo becomes a slim top
 * banner and the form stacks beneath it.
 */
export default function AuthLayout({ children }) {
  return (
    <div className="min-h-screen w-full bg-white lg:grid lg:grid-cols-2">
      {/* Form side */}
      <div className="flex flex-col justify-center px-6 py-10 sm:px-12 lg:px-16 xl:px-24">
        <div className="mx-auto w-full max-w-md">
          {/* Wordmark */}
          <div className="mb-10 flex items-center gap-2">
            <span className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-steel_blue to-fresh_sky">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M3 11.5 12 4l9 7.5" stroke="white" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                <path d="M5 10v9h14v-9" stroke="white" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </span>
            <span className="font-display text-lg font-800 tracking-tight text-ink_black" style={{ fontWeight: 800 }}>
              HomeServe
            </span>
          </div>
          {children}
        </div>
      </div>

      {/* Photo side */}
      <div className="relative hidden lg:block">
        <img
          src={heroImg}
          alt="A homeowner talking with a technician installing an outdoor light"
          className="absolute inset-0 h-full w-full object-cover"
        />
        {/* Ink-black gradient scrim so the caption stays legible */}
        <div
          className="absolute inset-0"
          style={{ background: 'linear-gradient(to top, rgba(5,25,35,0.85) 0%, rgba(5,25,35,0.15) 45%, rgba(5,25,35,0) 70%)' }}
        />
        <div className="absolute bottom-0 left-0 right-0 p-12">
          <p className="font-display text-3xl font-bold leading-tight text-white">
            From “what’s wrong?” to<br />“it’s fixed.”
          </p>
          <p className="mt-3 max-w-md text-base text-fresh_sky-900">
            Describe the problem, let our assistant diagnose it, and book a trusted
            local professional — all in one place.
          </p>
        </div>
      </div>
    </div>
  )
}
