<style>
  img{
    width:50px;
  }
</style>
<template>
<div class="row">
  <sidebar></sidebar>
  <div class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 main">
    <h2>答卷列表</h2>
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>序号</th>
            <th>姓名</th>
            <th v-for="th in itemsHead">
              {{ th.q }}
            </th>
            <th>报名日期</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(it,i) in dataList">
            <td>{{ (i+1) }}</td>
            <td>{{ it.uId }}</td>
            <td v-for="th in it.items">
              <img v-if="th.a.indexOf('pic:') > -1" :src="'/imgs/'+(th.a.split('pic:')[1])">
              <div v-else>{{ ((typeof th.a == 'object') ? (th.a+'') : (th.a || '--'))}}</div>
            </td>
            <td>{{ it.createdTime }}</td>
            <td>
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

import sidebar from './win/sidebar.vue'

var _methods = {
	init (){

    this.getList(this.$route.params.id)

	},getList (id){

    var vm = this;
    $.get(_api.results + id,function(res){
      var i = 0,k = res.data.length;
      for(;i <= k -1;i++){
        res.data[i].items = JSON.parse(res.data[i].items);
        vm.dataList.push(res.data[i]);
      }
      vm.itemsHead = vm.dataList[0].items;
    });
  }
};
export default {
  data () {
    return {
      dataList : [],
      itemsHead : []
    }
  },mounted (){

  	this.init();

  },components : {
  	sidebar
  },methods : _methods
}


</script>

<style>

