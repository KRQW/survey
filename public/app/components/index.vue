<style>
	@import "../assets/css/index.css";
</style>

<template>

<div class="v-page index" data-view="index">
	<vHeader :pageHeader="$root.pageHeader"></vHeader>
  <div class="list">
    <router-link class="item b-down arrow-left" v-for="item in dataList" 
    :to="{ name : 'detail' , params : { id :  item.id }}">
      <div class="item-body">
        <h1>{{ item.title }}</h1>
        <div class="time">{{ item.createdTime }}</div>
      </div>
    </router-link>
    <div v-if="!$root.loaded" class="list-loaded">没有更多了</div>
  </div>
</div>

</template>

<script>

import vHeader from './win/header.vue'

var _methods = {
	init (){
    var vm = this;
    vm.getList(0)
	},getList (page){

    var vm = this;
    $.get(_api.list + page,function(res){
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
    this.$root.pageHeader.title = 'SURVEY'
    this.$root.pageHeader.left.icon = '';

  },components : {
  	vHeader
  },methods : _methods
}

</script>


