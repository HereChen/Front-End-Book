# 尾递归调用

ES 2015 引入的 PTC（Proper Tail Call），从而可以进行 TCO（Tail Call Optimization，尾调用优化）。实际编码就是将尾调用调整为 PTC，以便 JS 引擎能够应用 TCO。因而，这项技术需要是否应用，是隐式的，需要开发人员自行辨认（因为只是调整代码的结构，没有明显的标识符）。除了隐式的技术应用不便于代码维护，同时也让调试不方便。

[Syntactic Tail Calls (STC)](https://github.com/tc39/proposal-ptc-syntax) 中用 `continue` 作为一种显式的方案。尾调用相关的问题可参阅 [ES2015, ES2016, and beyond](https://v8.dev/blog/modern-javascript) 和 [尾递归的后续探究](https://imweb.io/topic/5a244260a192c3b460fce275)。

**递归调用问题解决** 在不依赖于 TCO 的情况下，可采用 trampolines 这项技术解决 JS 引擎对递归调用栈深度的限制。关于尾递归调用，在《你不知道的 JavaScript（下卷）》第 7 章的尾递归调用一节描述比较详细。

```js
// 问题
function sum(num1, num2, ...nums) {
  num1 = num1 + num2;
  if (nums.length == 0) return num1;
  return sum( num1, ...nums );
}
sum(...Array(20000).fill(Math.random()));
// Firefox
// ↪ InternalError: too much recursion
// Chrome
// ↪ Uncaught RangeError: Maximum call stack size exceeded
```

```js
// trampolines 解决
// https://github.com/getify/Functional-Light-JS/blob/master/manuscript/ch8.md#trampolines
function trampoline(fn) {
    return function trampolined(...args) {
        var result = fn( ...args );

        while (typeof result == "function") {
            result = result();
        }

        return result;
    };
}

var sum = trampoline(
    function sum(num1,num2,...nums) {
        num1 = num1 + num2;
        if (nums.length == 0) return num1;
        return () => sum( num1, ...nums );
    }
);
sum(...Array(20000).fill(Math.random()));
```

## 阅读

* [TCO 兼容性](http://kangax.github.io/compat-table/es6/#test-proper_tail_calls_(tail_call_optimisation))，只有 Safari 是绿色的，Chrome 默认未启用。
* [Benjamin Johnson, Using trampolines to manage large recursive loops in JavaScript, 2018-05-14](https://blog.logrocket.com/using-trampolines-to-manage-large-recursive-loops-in-javascript-d8c9db095ae3)
