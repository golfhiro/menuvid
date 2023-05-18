module.exports = {
  content: [
    "../myapp/**/*.{html.erb, html, js}",
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
