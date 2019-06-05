# 权限管理

## AngularJS 分角色登录

不同角色/权限登录后所见菜单不一样. 方案如下:

1. 给不同的路由配置其角色/权限属性.
2. 登录进入时, 记录角色/权限.
3. 进入主页, 根据角色/权限构建菜单(view中包含全部菜单,非此角色菜单移除 Dom).
4. 点击菜单进入到对应路由时, 根据判断路由的角色/权限属性是否和登录进入时记录的一样.

此方案包括两部分的权限限制, 其一是将不必要的菜单移除 Dom, 但菜单对应的路由依然可用, 只是在页面上没有对应可操作的视图, 其二是路由和登录的角色/权限匹配. 以 AngularJS 为例, 对应每个步骤的代码如下.

1. 路由属性.

    ```javascript
    $stateProvider.state('Registration.Instructors', {
        url: "/Instructors",
        templateUrl: '/Scripts/App/Instructors/Templates/instructors.html',
        controller: 'InstructorController',
        data: { auth: "Admin"}
    })
    ```

2. 登录用户权限/角色信息可记录到 `rootScope` 中, 比如 `rootScope.adminType = "Admin"`.
3. 菜单保留与移除. `ng-if="adminType==='Admin'"`[^AngularJSDifferenceNgifNgshow].
4. 路由和登录角色/权限匹配[^AngularJSConditionalRouting].

```javascript
app.run(function($rootScope){
  $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams){
    if ( toState.data.auth !== $rootScope.adminType ) {
        event.preventDefault();
        return false;
    }
  })
});
```

[^AngularJSConditionalRouting]: [angularjs: conditional routing in app.config](http://stackoverflow.com/questions/20978248/angularjs-conditional-routing-in-app-config)
[^AngularJSDifferenceNgifNgshow]: [what is the difference between ng-if and ng-show/ng-hide](http://stackoverflow.com/questions/19177732/what-is-the-difference-between-ng-if-and-ng-show-ng-hide)

## Vue.js 权限管理

* [基于Vue实现后台系统权限控制](http://refined-x.com/2017/08/29/%E5%9F%BA%E4%BA%8EVue%E5%AE%9E%E7%8E%B0%E5%90%8E%E5%8F%B0%E7%B3%BB%E7%BB%9F%E6%9D%83%E9%99%90%E6%8E%A7%E5%88%B6/)
* [用addRoutes实现动态路由](http://refined-x.com/2017/09/01/%E7%94%A8addRoutes%E5%AE%9E%E7%8E%B0%E5%8A%A8%E6%80%81%E8%B7%AF%E7%94%B1/)
* [手摸手，带你用vue撸后台 系列二(登录权限篇)](https://juejin.im/post/591aa14f570c35006961acac)
* [Vue 后台管理控制用户权限的解决方案？](https://www.zhihu.com/question/58991978)
* [自定义指令](https://cn.vuejs.org/v2/guide/custom-directive.html)
* <https://codepen.io/diemah77/pen/GZGxPK>
