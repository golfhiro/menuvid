module.exports = {
  content: [
    "../menuvid/**/*.{html.erb, html, js}",
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
