# 图片

## 图片格式的选择

webp, gif, png, jpg, icon font

## webp

### 格式转换

```bash
# jpg 转换成 webp
sudo apt install webp
cwebp -q 50 input.jpg -o commu_phone.webp

# jpg 压缩
sudo apt install libjpeg-progs
jpegtran -copy none -optimize -perfect input.jpg > output.jpg
```

### 兼容性支持

```html
<picture>
  <source srcset="image.webp" type="image/webp" />
  <source srcset="image.jpg" type="image/jpeg" />
  <img src="image.jpg" />
</picture>
```

## icon font

字体图片有两个优点: 矢量图放大后不失真; 起到图片精灵的作用, 减少图片请求次数.

图片转成字体文件, 作为矢量图, 常用于图标. 工具可用 [iconfont](http://www.iconfont.cn/) 上传后生成 CSS 文件和字体.

## 图片延迟加载/懒加载(lazy load)

### 思路

延迟加载通常是将暂不需要的资源延后加载. 懒加载是延迟加载的一种, 即达到某个条件(或某个事件触发)时加载图片.

延迟加载可处理为, 当必要的资源加载完后再加载其余资源. 懒加载基本思路:

1. 暂存一张图片, 显示该默认图片.
2. 显示图片的元素在可视区域时, 加载该图片.

### 实例

具体到技术, [飞猪H5](https://h5.m.taobao.com/trip/home/index.html?_projVer=0.1.125) 的实现方法是:

```html
<div class="base-bg base-bg-m regular-product__image___Bu73a" data-reactid=".0.$=1$trip_home_arbitrary_gate_product_0.0.$=1$regular_item_1.0.$=10">
    <div data-lazyloadid="lazyload_item_36" class="fade" style="opacity: 1;background-image: url(&quot;//gw.alicdn.com/tips/i3/638737216/TB2vvwZtVXXXXX0XXXXXXXXXXXX_!!638737216.jpg_400x400q75.jpg_.webp&quot;);"
        data-reactid=".0.$=1$trip_home_arbitrary_gate_product_0.0.$=1$regular_item_1.0.$=10.$=11" data-imageloaded="true"></div>
</div>
```

1. 父元素上设置默认的背景图片.

    ```css
    .skin-yellow .base-bg {
      background: #f2f3f4 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALkAAABPCAMAAACAuJRqAAAAq1BMV…mgg7e+vIXHxHbzIMosU7LAtcvNOAUKpxf6kSUl8MPvAnj+AYRcPQeahlKYAAAAAElFTkSuQmCC) 50% no-repeat;
      background-size: auto .8rem;
    }
    ```

2. 子元素内联样式背景图片链接, 外链样式图片相关属性. 初始化时 `opacity: 0`, 并且不包含背景设置.

    ```css
    opacity: 1;
    background-image: url(//gw.alicdn.com/tips/i3/638737216/TB2vvwZtVXXXXX0XXXXXXXXXXXX_!!638737216.jpg_400x400q75.jpg_.webp);
    ```

    ```css
    .base-bg>div {
      width: 100%;
      height: 100%;
      background-repeat: no-repeat;
      background-position: 50%;
      background-size: cover;
    }
    ```

3. **满足条件时**, 设置子元素的背景图片(或者设置 img src 属性), 然后标识已加载的标签一个属性(比如 `data-imageloaded="true"`), 如果是 img 标签, 加载后删除 `data-src`.

### 关键点

这里的**满足条件时**, 可用以下逻辑. 检查元素是否在可视区域, 可全局循环检查, 至于是否有性能问题, 待考察.

```javascript
loadIfVisible() // 如果在可视区域则加载
onScroll(loadIfVisible()); // 滚动事件触发时, 检查
```

判断元素是否在可视区域

```javascript
// 判断元素是否在可视区域
function isInView(obj) {
  var e = obj.getBoundingClientRect();
  return !(e.top > window.innerHeight || e.bottom < 0 || e.left > window.innerWidth || e.right < 0)
}
```

## 参考扩展

1. [stackoverflow, How to tell if a DOM element is visible in the current viewport?](https://stackoverflow.com/questions/123999/how-to-tell-if-a-dom-element-is-visible-in-the-current-viewport#7557433)
2. [mozilla, Element.getBoundingClientRect()](https://developer.mozilla.org/zh-CN/docs/Web/API/Element/getBoundingClientRect)
3. [Image Optimization, Ilya Grigorik, https://developers.google.cn](https://developers.google.cn/web/fundamentals/performance/optimizing-content-efficiency/image-optimization)
4. [Using WebP Images, JEREMY WAGNER, https://css-tricks.com, 2016-08-26](https://css-tricks.com/using-webp-images/)
