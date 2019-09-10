# Node.js

**multiple imports** 多次导入模块.

> Modules are cached after the first time they are loaded. [Caching](https://nodejs.org/docs/latest/api/modules.html#modules_caching)

模块首次导入之后将被缓存, 这意味着: (1) 模块内如果有执行的代码, 只会被执行一次; (2) 每次导入的模块, 获取到的对象是一样的(不会因为修改而改变). 如下面的例子, `func1.mjs` 内的 `console.log("func1.mjs");` 只被执行了一次.

```javascript
// func1.mjs
console.log("func1.mjs");

// func2.mjs
import "./func1.mjs";
console.log("func2.mjs")

// app.mjs
import "./func1.mjs";
import "./func2.mjs";

console.log("app start")
```

```bash
node --experimental-modules app.mjs
# func1.mjs
# func2.mjs
# app start
```

## 阅读

* [The new ECMAScript module support in Node.js 12](http://2ality.com/2019/04/nodejs-esm-impl.html) Node.js CommonJS module 和 ECMAScript module 区别, 用法.
