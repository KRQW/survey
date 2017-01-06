<template>
  <div class="detail">
	<pageHeader :pageHeader="pageHeader"></pageHeader>
  </div>
</template>

<script>

import header from './win/header.vue'
import loader from './tools/loader.vue'

export default {
  data () {
    return {

    }
  },mounted (){

    this.$root.pageHeader.title = 'SURVEY DETAIL'

  },components : {
  	pageHeader : header,
    loader
  }
}
</script>
