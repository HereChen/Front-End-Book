文件
====

图片
----

### 图片格式的选择

webp, gif, png, jpg, icon font

### icon font

字体图片有两个优点: 矢量图放大后不失真; 起到图片精灵的作用,
减少图片请求次数.

图片转成字体文件, 作为矢量图, 常用于图标. 工具可用
[iconfont](http://www.iconfont.cn/) 上传后生成 CSS 文件和字体.

体验优化
========

骨架屏/Skeleton Screen
----------------------

骨架屏指的是数据呈现之前, 一般用浅色的色条勾勒渲染后的轮廓.
相对通常的空白区域或者加 loading, 体验会好一些. 其次还起到了占位的作用.

**文章**

1.  [Skeleton Screen --
    骨架屏](http://www.bestvist.com/2018/01/19/skeleton-screen/)
2.  [How to Speed Up Your UX with Skeleton
    Screens](https://www.sitepoint.com/how-to-speed-up-your-ux-with-skeleton-screens/)
3.  [Building Skeleton Screens with CSS Custom
    Properties](https://css-tricks.com/building-skeleton-screens-css-custom-properties/)

**实例**

Ant Design 的 loading card, <https://ant.design/components/card/>
