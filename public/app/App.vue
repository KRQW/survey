<style>
	@import "./assets/css/base.css";
		
	.slide-fade-leave-active {
		transform: translate3d(-30%,0,0);
		-webkit-transform: translate3d(-30%,0,0);
		transition-delay: .3s;
		-webkit-transition-delay: .3s;
	}
	.v-page.on{
		transform: translate3d(0,0,0);
		-webkit-transform: translate3d(0,0,0);
	}
	.back.v-page.slide-fade-leave-active{
		-webkit-transform: translate3d(30%,0%,0);
		transform: translate3d(30%,0%,0);
		transition-delay: .5s;
		-webkit-transition-delay: .5s;
	}
	.back.v-page ~ .slide-fade-enter-active{
		transform: translate3d(-100%,0,0);
		-webkit-transform: translate3d(-100%,0,0);
	}
</style>

<template>
<div class="view">
    <loader v-if="$root.loaded"></loader>
	<transition name="slide-fade">
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
		}
	},mounted (){
		var vview = $('.view');
		vview.find('.v-page').addClass('on');
		vview.on('click','.v-page header .iback',function(){
			$(this).parents('.v-page').addClass('back');
		});
	}
}
    
</script>