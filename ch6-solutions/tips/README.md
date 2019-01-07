# Tips

## `&&` 和 `||`

取一个对象的某个属性.

```javascript
// obj 不存在时会报错
const val1 = obj.attr1;

// 推荐, obj 存在时会取 && 右侧的值
const val2 = obj && obj.attr1;
```

当一个变量不存在时, 取一个默认值.

```javascript
// param 为 false, '', null 等值为假的情况需谨慎使用
const val1 = param || '';
```

## HTTP 状态及提示

## 限制宽度下的子元素图片全屏宽度

> [Full Width Containers in Limited Width Parents](https://css-tricks.com/full-width-containers-limited-width-parents/)

思路: 用相对定位, 将图片定位到屏幕右半边的最左侧(此时左侧剩余宽度为 50vw); 再通过 `margin-left: -50vw` 将图片定位到屏幕最左侧; `width: 100vw` 保证图片的全屏宽度.

```html
<style>
.limitied-width {
  width: 500px;
  margin: auto;
}
.full-width {
  width: 100vw;
  position: relative;
  left: 50%;
  right: 50%;
  margin-left: -50vw;
  margin-right: -50vw;
}
</style>
<div class="limitied-width">
    <img class="full-width" src="image.jpg" alt="">
</div>
```

## 平滑滚动到顶部

> [Smooth Scrolling](https://css-tricks.com/snippets/jquery/smooth-scrolling/)

在定位到指定滚动位置时, 直接使用 `window.scrollTo(0, 0)` 这样的方法, 滚动会比较生硬, 通过下面的方法可以实现平滑滚动.

```css
html {
  scroll-behavior: smooth;
}
```

```javascript
window.scrollTo({
  top: 0,
  left: 0,
  behavior: "smooth"
});
```

## 数组去重

此方法针对纯值类型的数组. `Set` 为集合之意, 集合的一个性质就是唯一性.

```javascript
const a = ["1", "2", "1"];
const uniqueA = [...new Set(a)];
// ["1", "2"]
```

比下面这种方法简短

```javascript
const a = ["1", "2", "1"];
const uniqueA = a.filter((v, i) => a.indexOf(v) === i);
// ["1", "2"]
```
