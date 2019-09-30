# setInterval 和 setTimeout

`setTimeout` 可以模拟 `setInterval`，两者都可以用于间隔计时，但执行时间间隔有区别 [javascript.info][2]。

```js
function func() {
  i++;
  console.log(i);
}

// setTimeout
// func 执行完成与下次开始执行，相隔 1s
i = 0;
setTimeout(function run() {
  func();
  setTimeout(run, 1000);
}, 1000);

// setInterval
// func 开始执行与下次开始执行，相隔 1s
i = 0;
setInterval(function() {
  func();
}, 1000);
```

[撒网要见鱼][1] 认为应当使用 `setTimeout` 而不是 `setInterval` 作为计时工具。原因是对 `setInterval` 而言有以下两个问题。

1. `func` 本身有执行时间，多次累计后，可能存在下一次要开始执行了，而这一次的还没有执行完。
2. 浏览窗口缩小后 `func` 不会执行，打开窗口后会立即全部执行（在 Firefox 测试过，确实如此）。

[1]: [撒网要见鱼, 从浏览器多进程到JS单线程，JS运行机制最全面的一次梳理, segmentfault, 2018](https://segmentfault.com/a/1190000012925872)
[2]: [Scheduling: setTimeout and setInterval, javascript.info](https://javascript.info/settimeout-setinterval)
