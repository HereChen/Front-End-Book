# 数据类型

> [6.1ECMAScript Language Types, tc39.github.io](https://tc39.github.io/ecma262/#sec-ecmascript-language-types)

总共 7 种数据类型: `Undefined`, `Null`, `Boolean`, `Number`, `Symbol`, `String`, `Object`. 其中, 前 6 种为原始数据类型([primitive type](https://tc39.github.io/ecma262/#sec-primitive-value)).

## 判断数据类型

### `typeof`

> [The typeof Operator](https://tc39.github.io/ecma262/#sec-typeof-operator)

想要通过 `typeof` 获取实际的数据类型会有如下的问题.

```javascript
console.log(typeof null);
// object

console.log(typeof function(){});
// function
```

### `Object.prototype.toString`

> [Object.prototype.toString(), tc39.github.io](https://tc39.github.io/ecma262/#sec-object.prototype.tostring)

`Object.prototype.toString.call(var1)` 也可以用于获取数据类型, 返回 `[object TYPE]`. 但由于可以通过 `Symbol.toStringTag` 自定义, 不能以此方法直接确定数据是否是 7 种数据类型之一.

```javascript
console.log(Object.prototype.toString.call(1234));
// [object Number]

class MyClass {
  get [Symbol.toStringTag]() {
    return 'Number';
  }
}

console.log(Object.prototype.toString.call(new MyClass()));
// [object Number]
```

## null, NaN, undefined

JavaScript中有 6 个值为“假”: `false`, `null`, `undefined`, `0`, `''`(空字符串), `NaN`. 其中 `NaN` 是 JavaScript 中唯一不等于自身的值, 即 `NaN == NaN` 为 `false`.

```javascript
console.log( false == null )      // false
console.log( false == undefined ) // false
console.log( false == 0 )         // true
console.log( false == '' )        // true
console.log( false == NaN )       // false

console.log( null == undefined ) // true
console.log( null == 0 )         // false
console.log( null == '' )        // false
console.log( null == NaN )       // false

console.log( undefined == 0 )    // false
console.log( undefined == '' )   // false
console.log( undefined == NaN )  // false

console.log( 0 == '' )           // true
console.log( 0 == NaN )          // false
```

对于 `===` 以上全为 `false`。对于 `==`，以下几组为 `true`：`null` 和 `undefined`；`false`、`0`、`''`。

## 扩展阅读

1. [JavaScript中奇葩的假值](http://www.cnblogs.com/snandy/p/3589517.html)
2. [阮一峰, undefined与null的区别, 2014](http://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)
3. [Symbol.toStringTag](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag)
