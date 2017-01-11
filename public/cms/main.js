import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import index from './components/index.vue'
import operate from './components/operate.vue'
import resutl from './components/resutl.vue'

global.$ = require('./assets/js/vendor/jquery-3.1.1.min')
global._api = require('./unit/api')

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { name : 'index', path : '/', component : index },
    { name : 'operate', path : '/operate/:id', component : operate },
    { name : 'resutl', path : '/resutl/:id', component : resutl }
  ]
})

new Vue({
	el : '#cms',
	router,
	render (h) { return h(App) },
	data (){
		return {
	    	pageHeader : {
	    		active : ''
	    	},
      		loaded : true
    	}
	}
})
