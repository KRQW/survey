<style>
	@import "../assets/css/index.css";
</style>

<template>

<div class="index">
	<pageHeader :pageHeader="pageHeader"></pageHeader>
  <div class="list">
    <router-link class="item b-down arrow-left" v-for="item in dataList" :to="{ name : 'detail' , params : { id :  item.id }}">
      <div class="item-body">
        <h1>{{ item.title }}</h1>
        <div class="time">{{ item.createdTime }}</div>
      </div>
    </router-link>
    <div class="list-loaded">没有更多了</div>
  </div>
  <loader :class="{ 'on' : !$root.loaded }"></loader>
</div>

</template>

<script>

import header from './win/header.vue'
import loader from './tools/loader.vue'

var _methods = {
	init (){

    this.getList()

	},getList (){

    var vm = this;
    $.get(_api.list,function(res){
      var i = 0,k = res.data.length;
      for(;i <= k -1;i++){
        vm.dataList.push(res.data[i]);
      }
      vm.$root.loaded = false;
    });

  }
};

export default {
  data () {

    return {
      dataList : []
    }
  },mounted (){

  	this.init();
    this.$root.pageHeader.title = 'SURVEY LIST'

  },components : {

  	pageHeader : header,
    loader

  },methods : _methods
}

/*

$("#confetti-btn").click(event => {
    playTrumpet();
    fireConfettiCannon();
});

*/
</script>


