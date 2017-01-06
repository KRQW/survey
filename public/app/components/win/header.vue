
<style>
	@import "../../assets/css/header.css"
</style>

<template>

<header class="b-down">
	<a href="javascript:;">{{ $root.pageHeader.leftTitle || '' }}</a>
	<h1> {{ $root.pageHeader.title }} </h1>
	<a href="javascript:;">{{ $root.pageHeader.rightTitle || '' }}</a>
</header>

</template>

<script>

export default {
	props : ['pageHeader']
}

</script>

