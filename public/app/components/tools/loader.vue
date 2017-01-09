<style>
    @import '../../assets/css/loader.css';
</style>

<template>

<div id="ajax-loading-screen">
	<div class="loading-icon"> 
		<div class="material-icon">
			<div class="spinner">
				<div class="right-side"><div class="bar"></div></div>
				<div class="left-side"><div class="bar"></div></div>
			</div>
			<div class="spinner color-2">
				<div class="right-side"><div class="bar"></div></div>
				<div class="left-side"><div class="bar"></div></div>
			</div>
		</div> 
	</div>
</div>

</template>
<script>
	

export default {
	mounted (){
		$('#ajax-loading-screen').one('animationend webkitAnimationEnd', function() {
			//$(this).remove();
		})//.off('click').remove();
	}
}

</script>