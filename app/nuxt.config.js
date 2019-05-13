import pkg from './package'

export default {
  mode: 'spa',
  server: {
    port: '8080' 
  },
  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [
      { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.8.1/css/all.css'},
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: [
    '~/assets/css/tailwind.css',
    'pikaday/css/pikaday.css'
  ],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
    '@/plugins/moment'
  ],

  /*
  ** Nuxt.js modules
  */
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],
  /*
  ** Axios module configuration
  */
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: '/users/login', method: 'post', propertyName: 'jwt' },
          logout: { url: '/users/logout', method: 'post' },
          user: { url: '/users/me', method: 'get', propertyName: 'data' }
        },
        tokenRequired: true,
        tokenType: 'bearer',
      }
    }
  },
  axios: {
    baseURL: 'http://localhost:3000/api/v1'
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
    }
  }
}
