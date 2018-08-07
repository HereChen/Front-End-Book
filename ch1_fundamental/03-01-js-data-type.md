## 类型、值和变量

### 数据类型

- 基本数据类型：String 字符串；Number 数字；Boolean 布尔。
- 复合数据类型：Object 对象；Array 数组。
- 特殊数据类型：Null 空对象；Undefined 未定义。

- [数据类型 (JavaScript), msdn](https://msdn.microsoft.com/zh-cn/library/7wkd9z69(v=vs.94).aspx)

### null, NaN, undefined

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

- [JavaScript中奇葩的假值](http://www.cnblogs.com/snandy/p/3589517.html)
- [阮一峰, undefined与null的区别, 2014](http://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)
