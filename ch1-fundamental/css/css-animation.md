# 动画

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
