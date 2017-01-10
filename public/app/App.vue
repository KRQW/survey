<style>
	@import "./assets/css/base.css";

	.slide-leave-active {
		transform: translate3d(-30%,0,0);
		-webkit-transform: translate3d(-30%,0,0);
		transition-delay: .3s;
		-webkit-transition-delay: .3s;
	}
	.v-page.on{
		transform: translate3d(0,0,0);
		-webkit-transform: translate3d(0,0,0);
	}
	.back.v-page.slide-leave-active{
		-webkit-transform: translate3d(30%,0%,0);
		transform: translate3d(30%,0%,0);
		transition-delay: .5s;
		-webkit-transition-delay: .5s;
	}
	.back.v-page ~ .slide-enter-active{
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
			$('.v-page').removeClass('on')
			setTimeout(function(){
				$('.v-page.'+to.name).addClass('on');
			},300);

			if('detail' == form.name){//back
				$('.v-page.detail').addClass('back');
			}
		}
	},mounted (){
		$('.v-page').addClass('on');
	}
}
    
</script>