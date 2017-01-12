<style>
	.c-form{
	    padding: 20px 0;
	    border-top: 1px solid #c1c1c1;
	    margin: 20px 0;
	}
	[type=checkbox], [type=radio]{
		margin-left: 15px;
	}
</style>
<template>
<div>
	<sidebar></sidebar>
	<div class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 main">
	<h2>管理问卷</h2>
	<form role="form" class="c-form">
		<div class="row" >
			<div v-if="key.type === 'text'" v-for="(key, i) in sData.items" class="form-group col-sm-8">
	            <label class="label-control" >{{ key.title }}：</label>
	            <div class="v-form-box">
	              <input type="text" v-model="formData[i]" 
	              :data-requi="key.required" 
	              :placeholder="'在此输入' + key.title" class="form-control"  />
	            </div>
	        </div><!-- text -->
	        <div v-if="key.type === 'radio'" v-for="(key, i) in sData.items" class="form-group col-sm-8">
	            <label class="label-control" >{{ key.title }}：</label>
	            <div class="v-form-item">
	              <label v-for="(it,it_i) in key.items">
	              <input v-model="formData[i]" 
	              :data-requi="key.required" 
	              :value="it.title" 
	              :name="'radio'+i" type="radio" /> {{ it.title }}</label>
	            </div>
	        </div><!-- radio -->
	        <div v-if="key.type === 'checkbox'" v-for="(key, i) in sData.items" class="form-group col-sm-8">
	            <label class="label-control" >{{ key.title }}：</label>
	            <div class="v-form-item">
	              <label v-for="(it,it_i) in key.items">
	              <input v-model="formData.box[it_i]" 
	              :data-requi="key.required" 
	              :name="'checkbox'+i" 
	              :value="it.title" type="checkbox" /> {{ it.title }}</label>
	            </div>
	        </div><!-- checkbox -->
	        <div v-if="key.type === 'textarea'" v-for="(key, i) in sData.items" class="form-group col-sm-8 area">
	            <label class="label-control" >{{ key.title }}：</label>
	            <div class="v-form-box">
	                <textarea v-model="formData[i]" 
	                :data-requi="key.required" 
	                :placeholder="'在此输入' + key.title" rows="4" class="form-control"></textarea>
	            </div>
	        </div><!-- textarea -->
		</div>
	</form>
    </div>
</div>
</template>

<script>
import sidebar from './win/sidebar.vue'

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
      sData : {},
      formData : {
        box :[]
      }
    }
  },mounted (){

  	this.$root.pageHeader.active = 'operate'
  	this.init();

  },components : {
  	sidebar
  },methods : _methods
}
</script>

<style>

