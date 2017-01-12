<style>
	@import "./assets/css/base.css";

	.slide-leave-active {
		transform: translate3d(-50%,0,0);
		-webkit-transform: translate3d(-50%,0,0);
	}
	.slide-enter-active{
		transform: translate3d(100%,0,0);
		-webkit-transform: translate3d(100%,0,0);
		opacity: 0;
	}
	.back.v-page.slide-leave-active,
	.slide-leave-active{
		transition-delay: .425s;
		-webkit-transition-delay: .425s;
	}
	.back.v-page.slide-leave-active{
		-webkit-transform: translate3d(50%,0%,0);
		transform: translate3d(50%,0%,0);
	}
	.back.v-page ~ .slide-enter-active{
		opacity: 0;
		transform: translate3d(-100%,0,0);
		-webkit-transform: translate3d(-100%,0,0);
	}
	
</style>

<template>
<div class="view">
    <loader v-if="$root.loaded"></loader>
	<transition name="slide">
		<router-view></router-view>
	</transition>
</div>
</template>

<script>

import loader from './components/tools/loader.vue'

export default {
	components:{
		loader
	},
	watch: {
		'$route': function (to,form) {
			if('detail' == form.name){//back
				$('.v-page.detail').addClass('back');
			}
		}
	}
}
    
</script>