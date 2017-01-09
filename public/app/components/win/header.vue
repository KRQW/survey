
<style>
	@import "../../assets/css/header.css";
</style>

<template>

<header class="b-down">
	<a :class="$root.pageHeader.left.icon" 
		:href="$root.pageHeader.left.url || 'javascript:;'">{{ $root.pageHeader.leftTitle || '' }}</a>
	<h1> {{ $root.pageHeader.title }} </h1>
	<a href="javascript:;">{{ $root.pageHeader.right.title || '' }}</a>
</header>

</template>

<script>

export default {
	props : ['pageHeader']
}

</script>

