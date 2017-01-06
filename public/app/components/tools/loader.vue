<style>
    @import '../../assets/css/loader.css';
</style>

<template>

<div class="load" id="jLoad">
    <div class="load-container load1 loadOverall">
        <div class="loader"></div>
    </div>
</div>

</template>
<script>
	

export default {
	mounted (){
		$('#jLoad').one('animationend webkitAnimationEnd', function() {
			$(this).remove();
		})//.off('click').remove();
	}
}

</script>