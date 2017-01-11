<style>
	
body {
  padding-top: 20px;
  padding-bottom: 20px;
}
.navbar {
  margin-bottom: 20px;
}

</style>

<template>
  <div class="index container">
	<div class="jumbotron">
		<h2>问卷列表</h2>
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>序号</th>
            <th>标题</th>
            <th>创建时间</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(it,i) in dataList">
            <td>{{ (i+1) }}</td>
            <td>{{ it.title }}</td>
            <td>{{ it.createdTime }}</td>
            <td>
              <router-link class="btn btn-blue btn-sm" :to="'resutl/'+it.id" >查看答卷</router-link>
            	<router-link class="btn btn-warning btn-sm" :to="'operate/'+it.id" >修改</router-link>
            	<router-link class="btn btn-danger btn-sm" to="/" >删除</router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
  </div>
</template>

<script>

import vHeader from './win/header.vue'

var _methods = {
	init (){

    this.getList(0)

	},getList (page){

    var vm = this;
    $.get(_api.list + page,function(res){
      var i = 0,k = res.data.length;
      for(;i <= k -1;i++){
        vm.dataList.push(res.data[i]);
      }
    });
  }
};
export default {
  data () {
    return {
      dataList : []
    }
  },mounted (){

  	this.$root.pageHeader.active = 'index'
  	this.init();

  },components : {
  	vHeader
  },methods : _methods
}
</script>

<style>

