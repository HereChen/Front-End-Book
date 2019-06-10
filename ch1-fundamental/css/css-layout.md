# 布局

## 定位

CSS 有三种基本的定位机制：普通流、浮动和绝对定位。任何元素都可以定位，不过绝对或固定元素会生成一个块级框，而不论该元素本身是什么类型。

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

* 如果一个标签的位置是绝对的，它又不在其他任何设定了 absolute、relative 或 fixed 定位的标签里面，那它就是相对于浏览器窗口进行定位。
* 如果一个标签处在另一个设定了 absolute、relative 或 fixed 定位的标签里面，那它就是相对于另一个元素的边沿进行定位。

reference: <http://www.w3school.com.cn/cssref/pr_class_position.asp>，[CSS实战手册（第2版）](http://book.douban.com/subject/4861462/)

## table

## 浮动

浮动和文档流

## flex

## grid

> <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout>

**可视化布局代码生成**

* [CSS Grid Generator](https://cssgrid-generator.netlify.com)
