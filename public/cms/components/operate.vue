<template>
<div class="opt container">
	<!-- <vHeader :pageHeader="$root.pageHeader"></vHeader> -->
	<div class="jumbotron">
		<h2>管理问卷</h2>
		<div class="row">
			<form class="form-horizontal" role="form">
			  <div class="modal-body">
				  <div v-for="key in sData.items" class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">{{ key.title }}</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="inputEmail3" placeholder="">
				    </div>
				    <div class="col-sm-2">
				      <router-link class="btn btn-danger btn-sm" to="/" >删除</router-link>
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
    	this.find(this.$route.params.id)
	},find (id){

	    var vm = this;
	    $.get(_api.find + id,function(res){
	    	res.data.items = JSON.parse(res.data.items);
	        vm.sData = res.data;
	    });
  	}
};
export default {
  data () {
    return {
      sData : {}
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

