## 进阶

### 深拷贝和浅拷贝

浅拷贝只拷贝一层对象的属性，深拷贝则递归拷贝了所有层级。而 JavaScript 存储对象都是存地址的，这就导致如果拷贝的是一个对象，而不是值，原来的对象和拷贝到的目标变量会指向同一个地址，更改其中任一一个，另一个也会更改。

```javascript
// 例1
var a = [1, 2, 3];
var b = a;
b[1] = 12344;
console.log(a);
// [1, 12344, 3]

// 例2
var obj = {a: 1, b: {p: 2}};
var newObj = {};
for (var i in obj) {
  newObj[i] = obj[i];
}
newObj.b.p = 3;
console.log(obj.b.p);
// 3
```

实现深拷贝的方法，对于只有数值的数组可以直接用 slice() 方法实现，通用的方法是循环加递归。外层为循环，内层判断属性对应值是否为对象（`typeof obj === 'object'`），如果是则递归，如果不是则直接赋值。

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

用 `JSON.parse(JSON.stringify(obj))` 也可用于深拷贝，但对于属性值有 function 的场景不应采用此法。

[javascript中的深拷贝和浅拷贝？](https://www.zhihu.com/question/23031215)
