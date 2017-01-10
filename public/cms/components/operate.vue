<template>
<div class="opt container">
	<vHeader :pageHeader="$root.pageHeader"></vHeader>
	<div class="jumbotron">
		<div class="row">
			<form class="form-horizontal" role="form">
			  <div class="modal-body">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">Sign in</button>
				    </div>
				  </div>
			  </div>
			</form>
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

  	this.$root.pageHeader.active = 'operate'
  	this.init();

  },components : {
  	vHeader
  },methods : _methods
}
</script>

<style>

