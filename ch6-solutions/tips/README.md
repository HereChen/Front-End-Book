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

思路: 用相对定位, 将图片定位到屏幕右半边的最左侧(此时左侧剩余宽度为 50vw); 再通过 `margin-left: -50vw` 将图片定位到屏幕最左侧; `width: 100vw` 保证图片的全屏宽度.
