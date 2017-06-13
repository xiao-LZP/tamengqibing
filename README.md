# tamengqibing
“塔萌奇兵”，一款防“保卫萝卜”的FLASH游戏。当屏幕出现红色圆圈时，表示当前位置只要HP达到一定值就可以建立炮台，否则不行；炮台建立后，左击升级，右击可以删除；舞台的许多东西是可以攻击打掉的，当鼠标放到上面会变成手形；当敌人死亡时，会有一定几率变成垃圾，这时，我们要把他拖到垃圾桶，垃圾桶类型对错会有相应的分数奖惩，一定时间不拖到垃圾桶，会复活，且速度更快，生命值更大；通关的条件是消灭所有敌人并且让敌人到达精灵的数量不大于5。“游戏视频.flv”演示了游戏的基本操作


# 基于Vue2.0+Vuex+Axios+NodeJs+Express+MySQL实现京东移动web商城
- 经过一个多月总算完成第一个版本
## 前端架构
- 页面结构(H5,CSS3,原生JS)
- 框架(基于Vue脚手架:vue-cli)进行搭建
- 数据请求处理框架(Axios)
- Vue-Router进行路由处理
- Vue-LazyLoad进行图片赖加载

## 服务端架构
- 选用NodeJs进行后台开发
- Express中间件进行服务的配置，路由、请求的处理
	- 官网 [http://www.expressjs.com.cn/](http://www.expressjs.com.cn/ "express官网")
- Mysql中间件处理与数据库的"通信"
- Body-Parser中间件进行前端请求参数的获取
- Cookie-Parser、Cookie-Session进行cookie与session的处理


## 数据库选取
- 采用MySQL进行相关数据库的设计与实现

## 目前项目已实现功能
1. 首页数据的展示
2. 分类页数据的展示
3. 购物车
4. 我的
5. 注册
6. 登录
7. 商品详情页
8. 商品搜索


## 安装

已安装MySQL数据库，然后导入migou.sql文件

然后通过`npm`安装本地服务第三方依赖模块(需要已安装[Node.js](https://nodejs.org/))

```
cd vue-jd
```

```
npm install 或 cnpm install(个人比较喜欢使用后者，下载依赖模块速度较快)
```

```
npm run dev
```

最后开启后台服务

```
node server.js
```

## 目录结构
<pre>
.
├── README.md           
├── libs               		// 后台常用工具模块的封装，比如格式化事件、MD5加密等
├── route              		// 后台接口的编写目录
├── server.js          		// 后台服务的配置文件
├── webpack.config.js  		// webpack配置文件
├── index.html         		// 项目入口文件
├── package.json       		// 项目配置文件
├── src                		// 生产目录
│   ├── assets         		// css js 和图片资源
│   ├── components     		// 各种Vue组件
│   ├── store          		// vuex状态管理器
│   ├── App.vue        		// 项目中全局Vue
│   ├── main.js        		// Webpack 预编译入口
│   └── router.config.js    // vue路由配置文件
</pre>

## 项目效果图


![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%871.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%872.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%873.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%874.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%875.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%876.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%877.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%878.png)

![](https://github.com/13025214712/tamengqibing/blob/master/screenshots/%E5%9B%BE%E7%89%879.png)


