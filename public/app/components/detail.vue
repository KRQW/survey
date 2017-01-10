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
            <div v-if="key.type === 'text'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-box">
                  <input type="text" v-model="formData[i]" 
                  :data-requi="key.required" 
                  :placeholder="'在此输入' + key.title" class="v-form-el"  />
                </div>
            </div><!-- text -->
            <div v-if="key.type === 'radio'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-item">
                  <label v-for="(it,it_i) in key.items">
                  <input v-model="formData[i]" 
                  :data-requi="key.required" 
                  :value="it.title" 
                  :name="'radio'+i" type="radio" /> {{ it.title }}</label>
                </div>
            </div><!-- radio -->
            <div v-if="key.type === 'checkbox'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-item">
                  <label v-for="(it,it_i) in key.items">
                  <input v-model="formData.box[it_i]" 
                  :data-requi="key.required" 
                  :name="'checkbox'+i" 
                  :value="it.title" type="checkbox" /> {{ it.title }}</label>
                </div>
            </div><!-- checkbox -->
            <div v-if="key.type === 'textarea'" v-for="(key, i) in surveyData.items" class="v-form-col area">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-box">
                    <textarea v-model="formData[i]" 
                    :data-requi="key.required" 
                    :placeholder="'在此输入' + key.title" rows="4" class="v-form-el"></textarea>
                </div>
            </div><!-- textarea -->
            <div v-if="key.type === 'image'" v-for="(key, i) in surveyData.items" class="v-form-col area">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-box">
                  
                </div>
            </div><!-- file -->
            <div class="v-form-col">
              <a href="javascript:;" :class="{ 'on' : $root.loaded }" @click="subForm" class="btn" >{{ $root.loaded ? '提交中...' : '提交' }}</a>
            </div>
        </div>
    </div>
</div>
</template>

<script>

var _methods = {
  init (){
    this.detail()
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
              vm.formData = {
                box :[]
              }
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
