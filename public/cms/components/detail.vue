<template>
  <div>
    <h1>{{ msg }}</h1>
    <router-link to="/">go to index</router-link>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Welcome to Your Vue.js detail'
    }
  }
}
</script>

<style>

