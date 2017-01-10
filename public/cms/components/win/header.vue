<template>
<nav class="navbar navbar-light bg-faded">
    <div class="container">
      <div class="collapse navbar-toggleable-xs">            
        <ul class="nav navbar-nav">
          <li class="nav-item" :class="{ 'active' : 'index' == pageHeader.active }" >
            <router-link class="nav-link" to="/" >首页</router-link>
          </li>
          <li class="nav-item" :class="{ 'active' : 'operate' == pageHeader.active }">
            <router-link class="nav-link" to="operate/0" >详情</router-link>
          </li>
        </ul>
      </div>
    </div>
</nav>
</template>

<script>
export default {
  props : ['pageHeader']
}
</script>
