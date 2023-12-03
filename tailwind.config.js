/* opt/ty-dev/tailwind.config.js */

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.{html.erb, html.slim, html}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
