# 滚动问题/scroll

## 移动端滚动卡顿

TODO: 原因, 怎么复现, 下面两个什么关系?

1. CSS: `-webkit-overflow-scrolling : touch`. (非标准属性 [-webkit-overflow-scrolling
](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-overflow-scrolling))
2. JS: `passive`

如果添加了 `touchstart` 监听, 移动端会把监听的事件执行完之后, 再执行浏览器默认的事件(滚动). 用户触发后和滚动之间, 需要先执行监听的事件, 从而导致滚动页面出现 "卡顿" 的表现.

```javascript
document.addEventListener('touchstart', onTouchStartEvent, {passive: true});
```

框架支持情况: Vue.js 支持 [Event & Key Modifiers](https://vuejs.org/v2/guide/render-function.html#Event-amp-Key-Modifiers), React 暂不支持 [](https://github.com/facebook/react/issues/6436)

refer:

1. [Improving Scroll Performance with Passive Event Listeners](https://developers.google.cn/web/updates/2016/06/passive-event-listeners)
2. [Passive events listener explainer](https://github.com/WICG/EventListenerOptions/blob/gh-pages/explainer.md)
3. [passive 的事件监听器](http://www.cnblogs.com/ziyunfei/p/5545439.html)

## 滚动穿透

场景: 由于弹窗下面的内容层有滚动, 导致有弹窗的时候可以滚动到内容层, 弹窗被滑动到上面.
