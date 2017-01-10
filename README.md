# 基于 vue + express + mysql 实现的问卷系统

## 目录介绍

``` bash

   survey
    │
    ├── app_controllers/ 存放app接口控制器
    │
    ├── cms_controllers/ 存放cms接口控制器
    │
    ├── node_modules/ 存放express框架所有依赖（默认目录）
    │
    ├── routes/ 路由文件相当于MVC中的Controller，默认index.js、users.js（默认目录）
    │
    ├── bin：存放启动项目的脚本文件，默认www（默认文件）
    │
    ├── app.js：应用核心配置文件，项目入口（默认文件）
    │
    ├── app_router.js：app接口控制器入口
    │
    ├── cms_router.js：cms接口控制器入口
    │
    ├── package.json：express依赖配置及开发者信息（默认文件）
    │
    ├── public/ 静态资源网站入口 （默认目录）
    │     │
    │     │
    │     ├── app/   移动端用户端
    │     │   │
    │     │   ├── assets/  资源文件
    │     │   │
    │     │   ├── components/  vue 组件
    │     │   │
    │     │   ├── unit/  公用js
    │     │   │
    │     │   ├── App.vue： 项目入口，根据个人需求做相应修改
    │     │   │
    │     │   ├── index.html：单页面入口
    │     │   │
    │     │   ├── main.js：项目的核心文件，全局的配置
    │     │
    │     │
    │     ├── cms/   后台管理页面
    │     │   │
    │     │   ├── assets/  资源文件
    │     │   │
    │     │   ├── components/  vue 组件
    │     │   │
    │     │   ├── unit/  公用js
    │     │   │
    │     │   ├── App.vue：  项目入口，根据个人需求做相应修改
    │     │   │
    │     │   ├── index.html：单页面入口
    │     │   │
    │     │   ├── main.js：项目的核心文件，全局的配置
    │     │
    │     ├── node_modules/ vue、webpack 依赖库
    │     │
    │     ├── webpack.config.js:   webpack配置（默认文件）
    │     │
    │     ├── package.json: 前端依赖配置及开发者信息（默认文件）
    │     │
    │     ├── dist/   最终发布目录
    │

```

# 接下来重点介绍vue2.0项目中常用模块

[vue2.0官网文档](http://doc.vue-js.com/v2/guide/) 

## 1. 国际惯例先介绍下什么是 Vue？

* 就是一个web前端框架;
* 适用于中小型项目;
* 特点是数据绑定、组件化等;
* 相比其他框架体积小，学习门槛低

## 2. 安装环境

> 这里默认已安装npm环境，直接安装vue环境

``` bash
# 安装webpack
npm install webpack -g

# 安装vue脚手架
npm install vue-cli -g

```

## 3. 开始

* 安装simple项目

``` bash

#通过vue脚手架初安装
vue init webpack-simple my-vue

#进入项目文件
cd my-vue

#安装依赖
npm install

# 运行dev 浏览器自动打开 localhost:8080/index.html，恭喜运行成功，开启你的vue之旅
npm run dev

or 

# 压缩
npm run build

``` 

* 核心文件

main.js
``` bash

var Vue = require('vue.vue');
var App = require('./App.vue');

//or ES6

import Vue from 'vue'
import App from './App'

new Vue({
  el: '#app',
  template: '<App/>',
  components: { App }
})

``` 

App.vue

> 组件中可以包含css、js、html

``` bash

<!-- html模板 -->
<template>
  <div id="app">  <!-- 每一个template下只能有一个入口元素，不能有多个同级元素 -->
    <home></home> <!-- home组件 -->
  </div>
</template>

<!-- js -->
<script>
import Home from './components/Home'

export default {
  name: 'app',
  components: {
    Home
  }
}
</script>

<!-- 样式 -->
<style>
  body{
   backgorund:#fff;
  }
  @import url("./assets/main.css");
</style>

``` 

## 4. 数据绑定

html
``` bash
<div id="app-6">
  <p>{{ message }}</p>
  <input v-model="message"> <!-- message为input的model 输入值自动改变message内容 -->
</div>

``` 

js
``` bash
var app6 = new Vue({
  el: '#app-6',
  data: {
    message: 'Hello Vue!'
  }
})

```

> 运行效果图

![res](http://static.open-open.com/lib/uploadImg/20161012/20161012105523_603.png)

### 5. Class 与 Style 绑定

> class

html
``` bash
<div v-bind:class="{ 'active' : isActive }"></div> <!-- { '类名' : 条件 } -->
```

js
``` bash
data: {
  isActive: true
}
```
结果
``` bash
<div class="static active"></div>
```

> style

html
``` bash
   <div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div> <!-- { 属性 : 值 } -->
```

js
``` bash
data: {
  activeColor: 'red',
  fontSize: 30
}
```
结果
``` bash
<div style="color:red;font-size:30px"></div>
```



## 6. 条件渲染

html
``` bash
<h1 v-if="ok">Yes</h1> <!-- v-if="ok == true" 这里和js语法相同 -->

or 添加一个 “else” 块：

<h1 v-if="ok">Yes</h1>
<h1 v-else>No</h1>   <!--需要注意的是 v-else 必须紧跟上一个兄弟元素才有效 -->

```

js
``` bash
data: {
  ok : true
}

```
## 7. 列表渲染

> 基本语法


html
``` bash
<ul id="example-1">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>

结果

* foo
* Bar

or

<ul id="example-1">
  <li v-for="(item,index) in items"> <!-- v-for="(key,索引) in 数组" -->
    {{index}}. {{ item.message }}
  </li>
</ul>

结果

* 1. foo
* 2. Bar

1.0 版本索引直接使用隐式对象$index

```

js
``` bash
var example1 = new Vue({
  el: '#example-1',
  data: {
    items: [
      {message: 'foo' },
      {message: 'Bar' }
    ]
  }
})

```

## 8. 事件处理器

html
``` bash
<div id="example-1">
  <button v-on:click="counter += 1">增加 1</button> <!-- v-on:click可以用简写 @click="counter += 1" -->
  <p>这个按钮被点击了 {{ counter }} 次。</p>
</div>

```

js
``` bash
var example1 = new Vue({
  el: '#example-1',
  data: {
    counter: 0
  }
})

```

## 9. slot内容分发

> 在父组件中插入元素属性标记 `slot` 的内容。之后这些内容被分发到子组件的 `slot` 元素中，根据 `name` 属性在子组件中重新组合。

父组件 （当于用jquery这样获取内容$('#Breadcrumbs').html()）
``` bash

<child>
<div id="Breadcrumbs" slot="Breadcrumbs">首页 <b> > </b> 子页</div>
</child>

```

子组件
``` bash

<slot name="Breadcrumbs"></slot>

```
or 接收子组件内容

子组件
``` bash

<slot val="hello from child"></slot>

```

父组件
``` bash

<child>
 <template scope="props">
   <span>hello from parent</span>
   <span>{{ props.text }}</span>
 </template>
</child>

```
