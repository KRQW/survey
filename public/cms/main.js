import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import index from './components/index.vue'
import detail from './components/detail.vue'

Vue.use(VueRouter)
const router = new VueRouter({
  routes: [
    { name : 'index', path : '/', component : index },
    { name : 'detail', path : '/detail/:id', component : detail }
  ]
})

/*router.beforeEach((to, from, next) => {
	next()
	console.log('beforeEach')
})
router.afterEach((to, from, next) => {
	console.log('afterEach')
})*/

new Vue({
	el : '#app',
	router,
	render (h) { return h(App) }
})
