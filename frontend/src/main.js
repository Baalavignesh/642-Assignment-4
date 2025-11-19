/**
 * Main entry point for the Student Survey Vue.js application.
 * Configures the app with Vue Router for navigation.
 */
import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'

createApp(App)
  .use(router)
  .mount('#app')
