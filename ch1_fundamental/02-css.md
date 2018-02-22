# CSS

定位, 盒模型, 浮动, 媒体查询(自适应布局).

## 定位

CSS 有三种基本的定位机制：普通流、浮动和绝对定位。任何元素都可以定位，不过绝对或固定元素会生成一个块级框，而不论该元素本身是什么类型。

**说明**

1. 默认值: static
2. 继承性: no
3. 版本: CSS2
4. JavaScript 语法: `object.style.position="absolute"`


| 值       |  描述   |
| :------- | :------ |
| absolute |    生成绝对定位的元素，相对于 static 定位以外的第一个父元素进行定位。元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。|
| fixed    |    生成绝对定位的元素，相对于浏览器窗口进行定位。元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。|
| relative |    生成相对定位的元素，相对于其正常位置进行定位。因此，"left:20" 会向元素的 LEFT 位置添加 20 像素。|
| static   |    默认值。没有定位，元素出现在正常的流中（忽略 top, bottom, left, right 或者 z-index 声明）。|
| inherit  |    规定应该从父元素继承 position 属性的值。|

- 如果一个标签的位置是绝对的，它又不在其他任何设定了 absolute、relative 或 fixed 定位的标签里面，那它就是相对于浏览器窗口进行定位。
- 如果一个标签处在另一个设定了 absolute、relative 或 fixed 定位的标签里面，那它就是相对于另一个元素的边沿进行定位。

reference: <http://www.w3school.com.cn/cssref/pr_class_position.asp>，[CSS实战手册（第2版）](http://book.douban.com/subject/4861462/)

## 盒模型

IE 盒模型和标准存在区别。

## 优先级

优先级**从高到低**，分三个层次描述。

1. 作者/用户/浏览器样式。作者样式指网页本身的样式，或者开发者编写的样式；用户样式指浏览网页的用户自己添加的样式表(通过浏览器设置)；浏览器样式指浏览器提供的默认样式。
    1. 标有 `!important` 的用户样式。
    2. 标有 `!important` 的作者样式。
    3. 作者样式。
    4. 用户样式。
    5. 浏览器样式。

2. 作者样式：内部样式（internal）、内联样式（inline）、外部样式（external）。内部样式 style 标签中声明的样式；内联样式指元素属性 style 中的样式；外部样式指通过 link 链接的外部文件中样式。
    1. 内联样式（行内样式）
    2. 内部样式
    3. 外部样式

外部样式和内部样式在优先级相同的情况下，后定义的会覆盖先定义的。

3. CSS 选择器
    1. ID 选择器：`#idname`
    2. 伪类：`:hover`
    3. 属性选择器：`input[type="text"]`
    4.  类选择器：`.classname`
    5. 元素(类型)选择器（包括伪元素）：`input`, `:after`
    6. 通用选择器：`*`

reference: [Cameron Moll, 精通CSS（第2版）](http://book.douban.com/subject/4736167/)，[优先级, mdn](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Specificity), [INLINE VS INTERNAL VS EXTERNAL CSS](https://vineetgupta22.wordpress.com/2011/07/09/inline-vs-internal-vs-external-css/)

## link 和 @import

- `@import` 和 link 混用时，可能会出现不同时下载的情况。
- 考虑两者混合使用的浏览器实现的不一样（下载次序）。

reference: [Steve Souders, don’t use @import](http://www.stevesouders.com/blog/2009/04/09/dont-use-import/), [外部引用CSS中 link与@import的区别](http://www.dreamdu.com/blog/2007/05/11/css_link_import/)

## 浮动和文档流

## 两栏等高布局

父元素设置 `overflow:hidden;`，子元素设置 `padding-bottom:10000px; margin-bottom:-10000px;`。
`overflow:hidden;` 截除超出的高度，`margin-bottom:-10000px;` 抵消较高内容超出的 `padding`。

``` html
<div id="fa">
  <div class="col">
    <p>1231321321</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
    <p>1313213</p>
  </div>
  <div class="col">45645456456</div>
</div>
```

```css
#fa {
  width: 800px;
  margin: 0 auto;
  background-color: #1524e5;
  overflow: hidden;
}

.col {
  float: left;
  width: 50%;
  padding-bottom: 10000px;
  margin-bottom: -10000px;
}

.col:first-child {
  background-color: #34ef34;
}
.col:last-child {
  background-color: #ef34ef;
}
```

refernce: [CSS/两栏并列等高布局](http://segmentfault.com/a/1190000000625584)

## 动画

动画的实现方式可以分为几种：CSS3 原生实现；JavaScript 实现 (操作 CSS、canavs、svg)；动画文件 (gif, flash)。

CSS3 的实现可以通过 @keyframes 和 animation 完成，@keyframes 定义动画，animation 调用动画。

```css
/* 定义 */
@keyframes changebackcolor{
  from {background: red;}
  to {background: yellow;}
}
/* 调用 */
div{
  animation: changebackcolor 5s;
}
```

reference: <http://www.w3school.com.cn/css3/css3_animation.asp>

## 垂直居中和水平居中

### 块元素垂直居中(transform)

此方案存在兼容性问题(Firefox 43 不支持, Chrome 46 支持)

```css
width: 250px;
height: 250px;
position: relative;
top: 50%;
transform: translateY(-50%);
```

### 块元素垂直居中(绝对定位)

```css
width: 250px;
height: 250px;
position: absolute;
top: 50%;
margin-top: -125px;
```

### 内联元素垂直居中

```css
/* 方案一: 块元素内容会居中, 需要设置高度 */
display: table-cell;
vertical-align: middle;

/* 方案二: 一般单行文本的上下居中 */
line-height: 50px;
```

### 块元素的水平居中

```css
width: 100px;
margin-left: auto;
margin-right: auto;
```
