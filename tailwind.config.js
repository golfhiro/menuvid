module.exports = {
  content: [
    // "../menuvid/**/*.{html.erb, html, js}",
    './app/views/**/*.html.erb',
    './app/helpers/*.rb',
    './app/assets/stylesheets/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
      extend: {
        colors: {
        },
      },
    },
  plugins: [
    require('daisyui'),
  ],
  daisyui: {
    themes: [
      "bumblebee"
    ],
  },
}
