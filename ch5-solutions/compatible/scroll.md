# 移动端滚动卡顿

怎么复现, 下面两个什么关系?

1. CSS: `-webkit-overflow-scrolling : touch`
2. JS: `passive`

如果添加了 `touchstart` 监听, 移动端会把监听的事件执行完之后, 再执行浏览器默认的事件(滚动). 用户触发后和滚动之间, 需要先执行监听的事件, 从而导致滚动页面出现 "卡顿" 的表现.

```javascript
document.addEventListener('touchstart', onTouchStartEvent, {passive: true});
```

refer:

1. [Improving Scroll Performance with Passive Event Listeners](https://developers.google.cn/web/updates/2016/06/passive-event-listeners)
2. [Passive events listener explainer](https://github.com/WICG/EventListenerOptions/blob/gh-pages/explainer.md)
3. [passive 的事件监听器](http://www.cnblogs.com/ziyunfei/p/5545439.html)
