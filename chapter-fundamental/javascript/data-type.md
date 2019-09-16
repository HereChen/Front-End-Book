# 数据类型

> [6.1ECMAScript Language Types, tc39.github.io](https://tc39.github.io/ecma262/#sec-ecmascript-language-types)

总共 7 种数据类型：`Undefined`, `Null`, `Boolean`, `Number`, `Symbol`, `String`, `Object`. 其中, 前 6 种为原始数据类型([primitive type](https://tc39.github.io/ecma262/#sec-primitive-value))。第 8 种类型 [BigInt](https://github.com/tc39/proposal-bigint) 目前处于 Stage 3，Firefox 和 Chrome 最新版本都已经支持。

## 判断数据类型

### `typeof`

> [The typeof Operator](https://tc39.github.io/ecma262/#sec-typeof-operator)

**不同值的返回** 如果用 `typeof` 检查数据类型，`null` 和函数返回不是实际的数据类型，实际的数据类型分别是 `Null` 和 `Object`。因此 `typeof` 返回的所有结果比数据类型多一种（`function`）。

```javascript
typeof 1
// ↪ "number"

typeof 1n
// ↪ "bigint"

typeof "1"
// ↪ "string"

typeof true
// ↪ "boolean"

typeof {}
// ↪ "object"

typeof undefined
// ↪ "undefined"

typeof Symbol(1)
// ↪ "symbol"

typeof null
// ↪ "object"

typeof (() => {})
// ↪ "function"

(() => {}) instanceof Object
// ↪ true
```

**为什么 `typeof null` 是 `object`** 简单理解，这是一个 bug，并且从产生这个问题的 JavScript 实现的版本开始，这个问题一直没有修复，因为修复会影响已有的代码。产生的原因是在这个 bug 出现的 JavaScript 实现版本中，数据有两个部分组成：类型标识、实际数据，而 Object 和 Null 的类型标识是一样的。更加详细的解释可参考 [The history of “typeof null”](https://2ality.com/2013/10/typeof-null.html)。

### `Object.prototype.toString`

> [Object.prototype.toString(), tc39.github.io](https://tc39.github.io/ecma262/#sec-object.prototype.tostring)

`Object.prototype.toString.call(var1)` 也可以用于获取数据类型，返回 `[object TYPE]`。但由于可以通过 `Symbol.toStringTag` 自定义，不能以此方法直接确定数据是否是 7 种数据类型之一。

```javascript
Object.prototype.toString.call(1234)
// ↪ [object Number]

class MyClass {
  get [Symbol.toStringTag]() {
    return 'Number';
  }
}

Object.prototype.toString.call(new MyClass())
// ↪ [object Number]
```

## null, NaN, undefined

JavaScript中有 6 个值为“假”：`false`，`null`，`undefined`，`0`，`''`(空字符串)，`NaN`。其中 `NaN` 是 JavaScript 中唯一不等于自身的值，即 `NaN == NaN` 为 `false`。

```javascript
false == null      // false
false == undefined // false
false == 0         // true
false == ''        // true
false == NaN       // false

null == undefined  // true
null == 0          // false
null == ''         // false
null == NaN        // false

undefined == 0     // false
undefined == ''    // false
undefined == NaN   // false

0 == ''            // true
0 == NaN           // false
```

对于 `===` 以上全为 `false`。对于 `==`，以下几组为 `true`：`null` 和 `undefined`；`false`、`0`、`''`。

## 阅读

* [JavaScript中奇葩的假值](http://www.cnblogs.com/snandy/p/3589517.html)
* [阮一峰, undefined与null的区别, 2014](http://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)
* [Symbol.toStringTag](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag)
