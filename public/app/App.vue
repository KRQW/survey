<style>
	@import "./assets/css/base.css";


.slide-fade-leave-to{
	transform: translate3d(0%,0,0);
	transition: transform .425s cubic-bezier(.4,.6,.2,1);
}
.slide-fade-leave-active {
	transform: translate3d(-30%,0,0);
	transition: all .425s cubic-bezier(.4,.6,.2,1);
	opacity: 0
}

.slide-fade-enter-to{
	transform: translate3d(100%,0,0);
	transition: transform .425s cubic-bezier(.4,.6,.2,1);
}
.slide-fade-enter-active {
	transform: translate3d(0,0,0);
	transition: transform .425s cubic-bezier(.4,.6,.2,1);
	transition-dely:.425s;
}

</style>

<template>

<div class="view">
	<transition name="slide-fade">
		<router-view></router-view>
	</transition>
</div>

</template>
