兼容性问题解决
==============

IE: 盒模型
----------

IE 默认情况下长宽包含 `padding` 和 `border`, 和其他浏览器的长宽存在区别,
建议添加 `border-sizing` 属性. 保持多个浏览器的一致性.

``` {.css}
box-sizing: border-box;
```

IE 8: map
---------

IE8 不支持 JavaScript 原生 map 函数, 可在任意地方加入如下的代码片段[^1].

``` {.javascript}
(function (fn) {
    if (!fn.map) fn.map = function (f) {
        var r = [];
        for (var i = 0; i < this.length; i++)
            if (this[i] !== undefined) r[i] = f(this[i]);
        return r
    }
    if (!fn.filter) fn.filter = function (f) {
        var r = [];
        for (var i = 0; i < this.length; i++)
            if (this[i] !== undefined && f(this[i])) r[i] = this[i];
        return r
    }
})(Array.prototype);
```

或者用 jQuery 的 map 函数.

``` {.javascript}
// array.map(function( ) { });
jQuery.map(array, function( ) {
}
```

IE 8: fontawesome 图标显示为方块
--------------------------------

对于修饰性不影响功能的图标, 可以做降级处理, 仅在非 IE 或者 IE9+
(条件注释[^2])情况下引入 fontawesome 图标库. (谷歌搜索了一堆方案都没用,
最后应用这种方式来解决).

``` {.html}
<!--[if (gt IE 8) | !IE]><!-->
<link rel="stylesheet" href="font-awesome.min.css">
<!--<![endif]-->
```

IE 10+ 浏览器定位
-----------------

IE 10+ 不支持条件注释, 因此需要其他方式定位这些浏览器. 如果只增加 CSS,
可采用以下方式定位[^3].

``` {.css}
/*IE 9+, 以及 Chrome*/
@media screen and (min-width:0\0) {
}

/*IE 10*/
@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
}

/*Edge*/
@supports (-ms-accelerator:true) {
}
```

另一种方式是 JavaScript 检测浏览器版本, 在 `body` 标签为特定浏览器添加
`class` 属性标识.

IE 6-8 CSS3 媒体查询(Media Query)
---------------------------------

引入 [Respond.js](https://github.com/scottjehl/Respond).

``` {.html}
<!--[if lt IE 9]>
<script src="respond.min.js"></script>
<![endif]-->
```

HTML
====

参数(input)在 form 之外
-----------------------

input 在 form 之外时, 在 input 元素内添加 form 属性值为 form 的 ID[^4].
这样 input 仍然可以看做隶属于此表单, jQuery `$('#formid').serialize();`
能够获取 form 之外的输入框值. 或者在提交 (`submit`) 表单时会同样提交
`outside` 这个值.

``` {.html}
<form id="formid" method="get">

    <label>Name:</label>
    <input type="text" id="name" name="name">

    <label>Email:</label>
    <input type="email" id="email" name="email">
    <input type="submit" form="contact_form" value="send form" />
</form>
<input type="text" name="outside" form="formid">
```

注意: IE8 `$('#formid').serialize();` 无法获取 `outside` 值.

模块化与组件化
==============

> 内嵌框架图(embedded)

模块化, 强调内聚, 包含完整的业务逻辑, 可以方便业务的复用. 组件化,
强调复用, 重点在于接口的暴露, 和构件的概念类似.

实现模块化
----------

业务相关的特殊性都应包含在同一个模块内, 具体到前端,
这些特性包括与业务相关的接口、状态、路由等.

实现组件化
----------

关键是如何暴露接口, 方便外部复用.

Vue.js 权限管理
===============

-   [基于Vue实现后台系统权限控制](http://refined-x.com/2017/08/29/%E5%9F%BA%E4%BA%8EVue%E5%AE%9E%E7%8E%B0%E5%90%8E%E5%8F%B0%E7%B3%BB%E7%BB%9F%E6%9D%83%E9%99%90%E6%8E%A7%E5%88%B6/)
-   [用addRoutes实现动态路由](http://refined-x.com/2017/09/01/%E7%94%A8addRoutes%E5%AE%9E%E7%8E%B0%E5%8A%A8%E6%80%81%E8%B7%AF%E7%94%B1/)
-   [手摸手，带你用vue撸后台
    系列二(登录权限篇)](https://juejin.im/post/591aa14f570c35006961acac)
-   [Vue
    后台管理控制用户权限的解决方案？](https://www.zhihu.com/question/58991978)
-   [自定义指令](https://cn.vuejs.org/v2/guide/custom-directive.html)
-   <https://codepen.io/diemah77/pen/GZGxPK>

系统方案
========

分角色登录
----------

不同角色/权限登录后所见菜单不一样. 方案如下:

1.  给不同的路由配置其角色/权限属性.
2.  登录进入时, 记录角色/权限.
3.  进入主页, 根据角色/权限构建菜单(view中包含全部菜单,非此角色菜单移除
    Dom).
4.  点击菜单进入到对应路由时,
    根据判断路由的角色/权限属性是否和登录进入时记录的一样.

此方案包括两部分的权限限制, 其一是将不必要的菜单移除 Dom,
但菜单对应的路由依然可用, 只是在页面上没有对应可操作的视图,
其二是路由和登录的角色/权限匹配. 以 AngularJS 为例,
对应每个步骤的代码如下.

1.  路由属性.

``` {.javascript}
$stateProvider.state('Registration.Instructors', {
     url: "/Instructors",
     templateUrl: '/Scripts/App/Instructors/Templates/instructors.html',
     controller: 'InstructorController',
     data: { auth: "Admin"}
})
```

2.  登录用户权限/角色信息可记录到 `rootScope` 中, 比如
    `rootScope.adminType = "Admin"`.
3.  菜单保留与移除. `ng-if="adminType==='Admin'"`[^5].
4.  路由和登录角色/权限匹配[^6].

``` {.javascript}
app.run(function($rootScope){
  $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams){
    if ( toState.data.auth !== $rootScope.adminType ) {
        event.preventDefault();
        return false;
    }
  })
});
```

[^1]: [Is the javascript .map() function supported in
    IE8?](http://stackoverflow.com/questions/7350912/is-the-javascript-map-function-supported-in-ie8)

[^2]: [About conditional
    comments](https://msdn.microsoft.com/en-us/library/ms537512(v=vs.85).aspx)

[^3]: [How do I target only Internet Explorer 10 for certain situations
    like Internet Explorer-specific CSS or Internet Explorer-specific
    JavaScript
    code?](http://stackoverflow.com/questions/9900311/how-do-i-target-only-internet-explorer-10-for-certain-situations-like-internet-e/14916454#14916454)

[^4]: [PLACING FORM FIELDS OUTSIDE THE FORM
    TAG](http://www.dreamdealer.nl/articles/form_fields_outside_a_form.html)

[^5]: [what is the difference between ng-if and
    ng-show/ng-hide](http://stackoverflow.com/questions/19177732/what-is-the-difference-between-ng-if-and-ng-show-ng-hide)

[^6]: [angularjs: conditional routing in
    app.config](http://stackoverflow.com/questions/20978248/angularjs-conditional-routing-in-app-config)
