/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        fresh_sky: {
          DEFAULT: '#00a6fb', 100: '#002132', 200: '#004364', 300: '#006496',
          400: '#0085c8', 500: '#00a6fb', 600: '#2fbaff', 700: '#63cbff',
          800: '#97dcff', 900: '#cbeeff',
        },
        steel_blue: {
          DEFAULT: '#0582ca', 100: '#011a29', 200: '#023452', 300: '#034f7a',
          400: '#0469a3', 500: '#0582ca', 600: '#14a5f9', 700: '#4fbcfa',
          800: '#8ad2fc', 900: '#c4e9fd',
        },
        baltic_blue: {
          DEFAULT: '#006494', 100: '#00141e', 200: '#00283b', 300: '#003d59',
          400: '#005176', 500: '#006494', 600: '#0097dc', 700: '#26baff',
          800: '#6ed1ff', 900: '#b7e8ff',
        },
        deep_space_blue: {
          DEFAULT: '#003554', 100: '#000a10', 200: '#001521', 300: '#001f31',
          400: '#002941', 500: '#003554', 600: '#006aa7', 700: '#00a0fd',
          800: '#54c0ff', 900: '#a9e0ff',
        },
        ink_black: {
          DEFAULT: '#051923', 100: '#010507', 200: '#020a0e', 300: '#030f15',
          400: '#04141d', 500: '#051923', 600: '#115476', 700: '#1d8fc8',
          800: '#5bb9e8', 900: '#addcf3',
        },
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', 'ui-sans-serif', 'system-ui', 'sans-serif'],
        sans: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
