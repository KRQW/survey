<template>
  <div>
    <h1>{{ msg }}</h1>
    <router-link to="detail/0">go to detail</router-link>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Welcome to Your Vue.js Home'
    }
  }
}
</script>

