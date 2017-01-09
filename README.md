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

## 接下来重点介绍vue2.0

#### 1. 国际惯例先介绍下什么是 Vue？

* 就是一个web前端框架，适用于中小型项目，特点是数据绑定、组件化等，[官网介绍](http://doc.vue-js.com/v2/guide/#Vue-js-是什么)  

#### 2. 数据绑定


``` bash

html

<div id="app-6">
  <p>{{ message }}</p>
  <input v-model="message"> <!-- message为input的model 输入值自动改变message值 -->
</div>

``` 

``` bash

js

var app6 = new Vue({
  el: '#app-6',
  data: {
    message: 'Hello Vue!'
  }
})

```

> 运行效果图


![res](http://static.open-open.com/lib/uploadImg/20161012/20161012105523_603.png)





