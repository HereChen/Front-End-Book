# 兼容性问题解决

## IE: 盒模型

IE 默认情况下长宽包含 `padding` 和 `border`, 和其他浏览器的长宽存在区别, 建议添加 `border-sizing` 属性. 保持多个浏览器的一致性.

```css
box-sizing: border-box;
```

## IE 8: map

IE8 不支持 JavaScript 原生 map 函数, 可在任意地方加入如下的代码片段[^IE8JavaScriptMap].

```javascript
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

```javascript
// array.map(function( ) { });
jQuery.map(array, function( ) {
}
```

[^IE8JavaScriptMap]: [Is the javascript .map() function supported in IE8?](http://stackoverflow.com/questions/7350912/is-the-javascript-map-function-supported-in-ie8)

## IE 8: fontawesome 图标显示为方块

对于修饰性不影响功能的图标, 可以做降级处理, 仅在非 IE 或者 IE9+ (条件注释[^IEConditionalComments])情况下引入 fontawesome 图标库. (谷歌搜索了一堆方案都没用, 最后应用这种方式来解决).

```html
<!--[if (gt IE 8) | !IE]><!-->
<link rel="stylesheet" href="font-awesome.min.css">
<!--<![endif]-->
```

[^IEConditionalComments]: [About conditional comments](https://msdn.microsoft.com/en-us/library/ms537512(v=vs.85).aspx)

## IE 10+ 浏览器定位

IE 10+ 不支持条件注释, 因此需要其他方式定位这些浏览器. 如果只增加 CSS, 可采用以下方式定位[^targetInternetExplorer10].

```css
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

另一种方式是 JavaScript 检测浏览器版本, 在 `body` 标签为特定浏览器添加 `class` 属性标识.

[^targetInternetExplorer10]: [How do I target only Internet Explorer 10 for certain situations like Internet Explorer-specific CSS or Internet Explorer-specific JavaScript code?](http://stackoverflow.com/questions/9900311/how-do-i-target-only-internet-explorer-10-for-certain-situations-like-internet-e/14916454#14916454)

## IE 6-8 CSS3 媒体查询(Media Query)

引入 [Respond.js](https://github.com/scottjehl/Respond).

```html
<!--[if lt IE 9]>
<script src="respond.min.js"></script>
<![endif]-->
```
