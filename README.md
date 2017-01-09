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
    │     │   ├── App.vue： 项目默认vue模板入口
    │     │   │
    │     │   ├── index.html：项目默认静态页面入口
    │     │   │
    │     │   ├── main.js：项目默认创建vue主文件
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
    │     │   ├── App.vue： 项目默认vue模板入口
    │     │   │
    │     │   ├── index.html：项目默认静态页面入口
    │     │   │
    │     │   ├── main.js：项目默认创建vue主文件
    │     │
    │     ├── node_modules/ vue、webpack 依赖库
    │     │
    │     ├── webpack.config.js:   webpack配置（默认文件）
    │     │
    │     ├── package.json: 前端依赖配置及开发者信息（默认文件）
    │

```
## vue 项目常用组件、属性、等介绍

