## 深拷贝和浅拷贝

> TODO: [结构化克隆算法](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm), 共享内存, Atomics

浅拷贝只拷贝一层对象的属性，深拷贝则递归拷贝了所有层级。而 JavaScript 存储对象都是存地址的，这就导致如果拷贝的是一个对象，而不是值，原来的对象和拷贝到的目标变量会指向同一个地址，更改其中任一一个，另一个也会更改。或者可以说，浅拷贝是拷贝存值的地址，深拷贝是拷贝值。一下是浅拷贝的示例。

```javascript
// 例1: 数值数组
var a = [1, 2, 3];
var b = a;
b[1] = 12344;
console.log(a);
// [1, 12344, 3]

// 例2: 对象
var obj = {a: 1, b: {p: 2}};
var newObj = {};
for (var i in obj) {
  newObj[i] = obj[i];
}
newObj.b.p = 3;
console.log(obj.b.p);
// 3
```

对象数组，比如 `[{a: 1}, {b: 2}]`，由于数组内部的值为引用对象，用 `slice` 拷贝仍然是浅拷贝。

实现深拷贝的方法，对于只有数值的数组可以直接用 `slice` 和 `concat` 方法实现，通用的方法是循环加递归。外层为循环，内层判断属性对应值是否为对象（`typeof obj === 'object'`），如果是则递归，如果不是则直接赋值。

```javascript
var obj = {a: 1, b: {p: 2}};
function deepClone(obj) {
  var result = obj.constructor === Array ? [] : {};
  for (var key in obj) {
    result[key] = typeof obj[key] !== 'object' ? obj[key] : deepClone(obj[key]);
  }
  return result;
}
```

总结：

1. 数组浅拷贝：`=`
2. 对象浅拷贝：`=` 或 `Object.assign({}, obj)`
3. 含值数组深拷贝：`[1,2,3].slice()` 或 `[].concat([1,2,3])`
4. 对象或数组深拷贝：`JSON.parse(JSON.stringify(obj))` 或者循环加递归。

备注：

`JSON.parse(JSON.stringify(obj))` 对于嵌套的对象或数组只包含 Primitive （只含值），但对于属性值有 function 或者 Date 等不应采用此法。

```javascript
var a = {a: 1, b: () => {}, c: new Date()}
// {a: 1, b: ƒ, c: Fri Jun 15 2018 11:10:49 GMT+0800 (China Standard Time)}
var o = JSON.parse(JSON.stringify(a))
// {a: 1, c: "2018-06-15T03:10:49.965Z"}
```

深拷贝辅助工具

```javascript
import * as cloneDeep from 'lodash/cloneDeep';
var obj = {a: 1, b: 2};
var clone = cloneDeep(obj);
```

- [javascript中的深拷贝和浅拷贝？](https://www.zhihu.com/question/23031215)
- [Deepcopy of JavaScript Objects and Arrays using lodash’s cloneDeep method](http://blog.bogdancarpean.com/deepcopy-of-javascript-objects-and-arrays-using-lodashs-clonedeep-method/)
