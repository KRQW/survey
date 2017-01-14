<style>
  @import "../assets/css/detail.css";
  @import "../assets/css/v-form.css";
</style>
<template>
<div class="v-page detail" data-view="detail">
    <vHeader :pageHeader="$root.pageHeader"></vHeader>
    <div class="v-form">
        <div class="v-form-inner">
            <div class="v-form-col">
                <div class="v-form-h1">{{ surveyData.title }}</div>
            </div><!-- title -->
            <div v-for="(key, i) in surveyData.items" class="v-form-col">

                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>                
                <div v-if="key.type === 'text'" class="v-form-box">
                  <input type="text" v-model="formData[i]" 
                  :data-requi="key.required" 
                  :placeholder="'在此输入' + key.title" class="v-form-el"  />
                </div><!-- text -->
                <div v-if="key.type === 'radio'" class="v-form-item">
                  <label v-for="(it,it_i) in key.items">
                  <input v-model="formData[i]" 
                  :data-requi="key.required" 
                  :value="it.title" 
                  :name="'radio'+i" type="radio" /> {{ it.title }}</label>
                </div><!-- radio -->
                <div v-if="key.type === 'checkbox'" class="v-form-item">
                  <label v-for="(it,it_i) in key.items">
                  <input v-model="formData.box[it_i]" 
                  :data-requi="key.required" 
                  :name="'checkbox'+i" 
                  :value="it.title" type="checkbox" /> {{ it.title }}</label>
                </div><!-- checkbox -->
                <div class="v-form-box area" v-if="key.type === 'textarea'">
                    <textarea v-model="formData[i]" 
                    :data-requi="key.required" 
                    :placeholder="'在此输入' + key.title" rows="4" class="v-form-el"></textarea>
                </div><!-- textarea -->
                <div v-if="key.type === 'image'">
                  <div class="v-form-box up">
                      <a class="plus" href="javascript:;"><span>选择照片</span></a>
                      <input @change="chooseImg($event)" 
                      :data-title="key.title" 
                      class="el" 
                      data-type="image" 
                      :data-req="key.required"  
                      type="file" :id="'eFile'+i" />
                      <!-- accept="image/*"  -->
                  </div>
                  <div class="pics clearfix"></div>
                </div><!-- image -->

            </div><!-- for -->
            <div class="v-form-col">
              <a href="javascript:;" :class="{ 'on' : $root.loaded }" @click="subForm" class="btn" >{{ $root.loaded ? '提交中...' : '提交' }}</a>
            </div>
        </div>
    </div>
</div>
</template>

<script>

import upImage from '../unit/upload.js'

var _methods = {
  init (){
    this.detail()
  },chooseImg (e){
    var vm = this,
        _img = $(e)[0],
        efile = $(_img.target);
        var simg = efile.parent().parent().find('.pics');
        if(!/image\/\w+/.test(e.target.files[0].type)){
          alert("请确保文件为图像类型");
          return;
        }else{
            vm.$root.loaded = true;
            upImage.readFile(efile[0],simg,function(){
              vm.$root.loaded = false;
            });
        }

  },subForm (){
    if(this.$root.loaded)return;
      var vm = this,
        resutData = [],
        vsd = vm.surveyData.items,
        _obj = {},
        _box = [];

        vm.$root.loaded = true;
        for(var i = 0;i <= vsd.length - 1;i++){

          if('checkbox' === vsd[i].type){
            $('input[name=checkbox'+i+']:checked').each(function(i,e){
              _box.push($(e).val())
            })
            _obj =  {
              q : vsd[i].title,
              a : _box || ''
            }
          }else{
            _obj =  {
              q : vsd[i].title,
              a : vm.formData[i] || ''
            }
          }
          resutData.push(_obj);
        }//for

        var _body = {
          sId : vm.$route.params.id,
          items : JSON.stringify(resutData)
        };
        var geturl = _api.add + vm.$route.params.id + '/' + JSON.stringify(resutData);
        $.get(geturl,function(res){
            vm.$root.loaded = false;
            if(0 == res.code){
              alert('提交成功');
              history.back();
            }else{
              alert('提交失败');
            }
        }).fail(function(){
            vm.$root.loaded = false;
            alert('提交失败');
        });

  },clearVal (el,i){
  },detail (){
    var vm = this;
    vm.$root.loaded = true;
    $.get(_api.find + vm.$route.params.id,function(res){
      vm.surveyData =  res.data;
      vm.surveyData.items = JSON.parse(vm.surveyData.items);
      vm.$root.loaded = false;
    });
  }
};

import vHeader from './win/header.vue'

export default {
  data () {
    return {
      surveyData : {},
      formData : {
        box :[]
      }
    }
  },mounted (){
    var _ph = this.$root.pageHeader;
    _ph.left.icon = 'iback';
    _ph.left.url = '#/';
    _ph.title = 'DETAIL';
    this.init();

  },components : {
  	vHeader : vHeader,
  },methods : _methods
}
</script>
