# 系统方案

## 分角色登录

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


