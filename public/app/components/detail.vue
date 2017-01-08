<style>
  @import "../assets/css/detail.css";
  @import "../assets/css/v-form.css";
</style>
<template>
<div class="v-page detail">
    <pageHeader :pageHeader="pageHeader"></pageHeader>
    <div class="v-form">
        <div class="v-form-inner">
            <div class="v-form-col">
                <div class="v-form-h1">{{ surveyData.title }}</div>
            </div>
            <div v-if="key.type === 'text'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-box">
                  <input type="text" class="v-form-el"  />
                </div>
            </div>
            <div v-if="key.type === 'radio'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-item">
                  <label v-for="(it,it_i) in key.items"><input :name="'radio'+i" type="radio" /> {{ it.title }}</label>
                </div>
            </div>
            <div v-if="key.type === 'checkbox'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-item">
                  <label v-for="(it,it_i) in key.items"><input type="checkbox" /> {{ it.title }}</label>
                </div>
            </div>
            <div v-if="key.type === 'textarea'" v-for="(key, i) in surveyData.items" class="v-form-col">
                <div class="v-form-title" :class="{ 'requi' : key.required }">{{ key.title }}：</div>
                <div class="v-form-box">
                <textarea rows="4" class="v-form-el"></textarea>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>

import header from './win/header.vue'
import loader from './tools/loader.vue'

var _methods = {
  init (){

    this.detail()

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

export default {
  data () {
    return {
      surveyData : {}
    }
  },mounted (){

    this.$root.pageHeader.title = 'SURVEY DETAIL';
    this.init();

  },components : {
  	pageHeader : header,
    loader
  },methods : _methods
}
</script>
