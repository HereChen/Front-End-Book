# JavaScript

Cookie 写入。

## JavaScript 组成

一个完整的 JavaScript 实现是由以下 3 个不同部分组成的：

- 核心（ECMAScipt）
- 文档对象模型（DOM）
- 浏览器对象模型（BOM）

- [JavaScript 实现](http://www.w3school.com.cn/js/pro_js_implement.asp)
- [JavaScript学习总结（三）BOM和DOM详解](http://segmentfault.com/a/1190000000654274)

## 函数

### 常用函数

- `string.slice(start,end)` 复制 string 中的一部分。
- `string.indexOf(searchString, position)` 在 string 中查找 searchString。如果被找到，返回第一个匹配字符的位置，否则返回 -1。可选参数 position 可设置从 string 的某个指定的位置开始查找。
- `object.hasOwnProperty(name)`

### Array

#### 改变原数组

- `array.pop()` 移除最后一个元素。
- `array.push(item...)` 将一个或多个参数附加到数组的尾部。
- `array.reverse()` 反转 array 元素的顺序。
- `array.sort(camprefn)` 数组排序。
- `array.shift()` 移除数组中的第一个元素并返回该元素。
- `array.splice(start, deleteCount, item)` 从 array 中移除一个或多个元素并用新的 item 替换他们。
- `array.copyWithin(target, start, end)` 将 start 到 end（可选）的元素复制到 target 位置（会覆盖原有的元素）。

#### 不改变原数组

- `array.concat(item...)` 产生一个新数组，它包含一份 array 的前复制，并把一个或多个参数 item 附加在其后面。
- `array.join(separator)` join 方法把一个 array 构成一个字符串。它先把 array 中的每个元素构造成一个字符串，接着用一个 separator 分隔符把它们连接在一起。
- `array.map(item => )` 数组映射, 依次处理数组中的每一项.
- `array.filter(item => )` 数组过滤, 保存返回为真的项.
- `array.reduce(callback(previousValue,currentValue,index,array))` 累加器。
- [forEach(callback(currentValue[, index[, array]]){})](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach), 循环。
- [some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some), 是否有某个元素满足条件(回掉返回true).
- [every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every), 是否全部元素满足条件。

### Date

```javascript
var t = new Date();
var tt = [
    t.getFullYear(), '年', // 不是 getYear()
    t.getMonth() + 1, '月',
    t.getDate(), '日', ' ',
    t.getHours(), '时',
    t.getMinutes(), '分',
    t.getSeconds(), '秒'
].join('');
console.log(tt); // 2015年10月30日 22时6分21秒
```

注意 `getMonth()` 和 `getDay()` 都是从 0 开始的，需要加 1。

- [Date, mdn](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)

### typeof 和 instanceof

1. typeof: `typeof operand`

    typeof 操作符返回一个字符串,表示未经求值的操作数(unevaluated operand)的类型。typeof 只有一个实际应用场景，就是用来检测一个对象是否已经定义或者是否已经赋值。而这个应用却不是来检查对象的类型。除非为了检测一个变量是否已经定义，我们应尽量避免使用 typeof 操作符。

    ```javascript
    typeof foo == 'undefined'  // 若 foo 未定义, 返回 true
    ```

    类型      | 结构
    :---      | :---
    Undefined |  "undefined"
    Null      | "object"
    布尔值    | "boolean"
    数值      |  "number"
    字符串    | "string"
    Symbol (ECMAScript 6 新增)  |  "symbol"
    宿主对象(JS环境提供的，比如浏览器) | Implementation-dependent
    函数对象 (implements [[Call]] in ECMA-262 terms)  |  "function"
    任何其他对象 | "object"

2. instanceof: `object instanceof constructor`

    instanceof 运算符可以用来判断某个构造函数的 prototype 属性是否存在另外一个要检测对象的原型链上。(instanceof 运算符用来检测 constructor.prototype 是否存在于参数 object 的原型链上。)

    ```javascript
    function C(){} // 定义一个构造函数
    function D(){} // 定义另一个构造函数

    var o = new C();
    o instanceof C; // true,因为:Object.getPrototypeOf(o) === C.prototype
    o instanceof D; // false,因为D.prototype不在o的原型链上
    o instanceof Object; // true,因为Object.prototype.isPrototypeOf(o)返回true
    C.prototype instanceof Object // true,同上

    C.prototype = {};
    var o2 = new C();
    o2 instanceof C; // true
    o instanceof C; // false,C.prototype指向了一个空对象,这个空对象不在o的原型链上.

    D.prototype = new C();
    var o3 = new D();
    o3 instanceof D; // true
    o3 instanceof C; // true
    ```

- [typeof 和 instanceOf的区别](http://segmentfault.com/a/1190000000730982)
- [instanceof](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/instanceof)
- [typeof](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/typeof)

### setInterval 和 setTimeout

- `setTimeout` 只执行一次
- `setInterval` 连续执行多次

### call 和 apply

通过 call 和 apply, 可以实现自定义函数调用的上下文.

1. call: `fun.call(thisArg, arg1, arg2, ...)`

    call() 方法在使用一个指定的this值和若干个指定的参数值的前提下调用某个函数或方法.

    thisArg
    : 在fun函数运行时指定的this值。需要注意的是，指定的 this 值并不一定是该函数执行时真正的 this 值，如果这个函数处于非严格模式下，则指定为 null 和 undefined 的 this 值会自动指向全局对象(浏览器中就是 window 对象)，同时值为原始值(数字，字符串，布尔值)的 this 会指向该原始值的自动包装对象。

    arg1, arg2, ...
    : 指定的参数列表。

    ```javascript
    /* 将函数的参数 arguments 转换为数组 */
    function listFirst(){
        // this 指向 arguments
        // 下面的语句相当于 arguments.slice(0)，但由于 arguments 不是数组，不能直接调用 slice 方法
        var arr = Array.prototype.slice.call(arguments, 0);
        for (var i=0; i < arr.length; i++){
            console.log(arr[i]);
        }
    }

    listFirst(1,2,3); // 调用, 输出 1,2,3
    ```

2. apply: `fun.apply(thisArg, [argsArray])`

    apply() 方法在指定 this 值和参数（参数以数组或类数组对象的形式存在）的情况下调用某个函数。

    thisArg
    : 在 fun 函数运行时指定的 this 值。需要注意的是，指定的 this 值并不一定是该函数执行时真正的 this 值，如果这个函数处于非严格模式下，则指定为 null 或 undefined 时会自动指向全局对象（浏览器中就是window对象），同时值为原始值（数字，字符串，布尔值）的 this 会指向该原始值的自动包装对象。

    argsArray
    : 一个数组或者类数组对象，其中的数组元素将作为单独的参数传给 fun 函数。如果该参数的值为null 或 undefined，则表示不需要传入任何参数。从ECMAScript 5 开始可以使用类数组对象。浏览器兼容性请参阅本文底部内容。

    在调用一个存在的函数时，你可以为其指定一个 this 对象，无需此参数时第一个参数可用 null（比如对于 add）。 this 指当前对象，也就是正在调用这个函数的对象。 使用 apply， 你可以只写一次这个方法然后在另一个对象中继承它，而不用在新对象中重复写该方法。

    ```javascript
    /* 例一: 将函数的参数 arguments 转换为数组 */
    function listFirst(){
        // this 指向 arguments
        var arr = Array.prototype.slice.apply(arguments, [0]);
        for (var i=0; i < arr.length; i++){
            console.log(arr[i]);
        }
    }

    listFirst(1,2,3); // 调用, 输出 1,2,3

    /* 例二: push 一个数组 */
    var arr1=new Array("1","2","3");
    var arr2=new Array("4","5","6");
    Array.prototype.push.apply(arr1,arr2);
    ```

- [Function.prototype.apply()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)
- [apply 和call的用法](http://segmentfault.com/a/1190000000725712)

### new/构造函数

构造函数只是一些使用 new 操作符时被调用的普通函数。使用 new 来调用函数，或者说发生构造函数调用时，会自动执行下面的操作。

1. 创建（或者说构造）一个全新的对象。
2. 这个新对象会被执行 [[prototype]] 链接。
3. 这个对象会绑定到函数调用的 this。
4. 如果函数没有返回其他对象，那么 new 表达式中的函数调用会自动返回这个新对象。

### 函数调用模式

除了声明时定义的形式参数, 每个函数还接收两个附加的参数: this 和 arguments. 在 JavaScript 中一共有 4 种调用模式: 方法调用模式、函数调用模式、构造器调用模式和 apply 调用模式. 函数调用的模式不同, 对应的 this 值也会不同。

1. 方法调用模式

    当一个函数被保存为对象的一个属性时，我们称它为一个方法。当一个方法被调用时，this 被绑定到该对象。

    ```javascript
    // print 作为 obj 属性被保存，当 print 被调用时，this 指向 obj
    var obj = {
        value: 'I am a string.',
        print: function (){
            console.log(this.value);
        }
    }

    obj.print(); // 调用
    ```

2. 函数调用模式

    当一个函数并非一个对象的属性时, 那么它就是被当做一个函数来调用。以此模式调用函数时，this 被绑定到全局对象。

    ```javascript
    var func = function(){
        console.log('Hello here.');
    }

    func(); // 调用
    ```

3. 构造器调用模式

    如果在一个函数前面带上 new 来调用，那么背地里将会创建一个连接到该函数的 prototype 成员的新对象，同时 this 会绑定到那个新对象上。

    ```javascript
    var Quo = function(string){
        this.status = string;
    }
    Quo.prototype.get_status = function(){
        return this.status;
    }

    var myQuo = new Quo('new Quo.') // 调用
    myQuo.get_status(); // "new Quo."
    ```

4. apply 调用模式

    apply 方法让我们构建一个参数数组传递给调用函数。它允许我们选择 this 的值。apply 方法接收两个参数，第 1 个是要绑定给 this 的值，第 2 个就是一个参数数组.

- [《JavaScript语言精粹(修订版)》，第4章 函数](http://book.douban.com/subject/3590768/)

### this

this 在运行时绑定，它的上下文取决于函数调用时的各种条件。this 的绑定和函数声明的位置没有任何关系，只取决于函数的调用方式。

判断 this 的优先级，可以按照下面的顺序进行判断：

1. 函数是否在 new 中调用 (new 绑定)？如果是的话 this 绑定的是新创建的对象。

    ```javascript
    var bar = new foo(); // 绑定 bar
    ```

2. 函数是否通过 call、apply (显示绑定) 或者硬绑定调用？如果是的话，this 绑定的是指定的对象。

    ```javascript
    var bar = foo.call(obj2); // 绑定 obj2
    ```

3. 函数是否在某个上下文对象中调用 (隐式调用)？如果是的话，this 绑定的是那个上下文对象。(调用时是否被某个对象拥有或包含，对象属性引用链中只有最顶层或者最后一层会影响调用位置 `obj1.obj2.foo(); // 绑定 obj2`)

    ```javascript
    var bar = obj1.foo(); // 绑定 obj1
    ```

4. 如果都不是的话，使用默认绑定。如果在严格模式下，就绑定到 undefined，否则绑定到全局对象 (window)。

    ```javascript
    var bar = foo(); // 绑定 undefined 或 window
    ```

可总结为:

1. 作为方法调用, 上下文为方法的拥有者.
2. 作为全局函数调用, 上下文为 window.
3. 作为构造函数调用, 上下文为新创建的实例对象.
4. call 和 apply 可以自定义上下文.
5. 箭头函数的上下文为其所在作用域的上下文.

- [你不知道的JavaScript（上卷）](http://book.douban.com/subject/26351021/)
- [JavaScript忍者秘籍, p52](https://book.douban.com/subject/26638316/)

### 闭包

当函数可以记住并访问所在的词法作用域时，就产生了闭包，即使函数是在当前词法作用域之外执行[^jsYouDonotKnowJs]。(闭包是发生在定义时的。)

```javascript
// foo() 定义的中括号内就是 bar 的词法作用域
function foo() {
  var a = 2;
  function bar() {
    console.log( a );
  }
  return bar;
}
var baz = foo();
baz(); // 2, 这就是闭包, 用到变量 a
```

```javascript
var fn;
function foo() {
  var a = 2;
  function baz() {
    console.log( a ); // 2
  }
  fn = baz; // 将 baz 赋值给全局变量
  // 调用 fn 相当于执行的 baz, 而其词法作用域在 foo() 定义函数内.
}

function bar(fn) {
  fn(); // 这就是闭包, 用到变量 a
}

foo();
bar(); // 2
```

[^jsYouDonotKnowJs]: [你不知道的JavaScript（上卷）](http://book.douban.com/subject/26351021/)

## 继承方法

- 原型链继承
- 构造继承
- 实例继承
- 拷贝继承

- [继承与原型链, mdn](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Inheritance_and_the_prototype_chain), [RayChase, JavaScript实现继承的几种方式](http://raychase.iteye.com/blog/1337415)

## ES5

> 新功能包括：原生 JSON 对象、继承的方法、高级属性的定义以及引入严格模式。

- [梦禅, ECMAScript各版本简介及特性, segmentfault](http://segmentfault.com/a/1190000003493604)

## ES6

模块，类，块级作用域，Promise，生成器...

### 箭头函数

1. 优点:箭头函数可省略 `function`, 单行的情况下可省略 `return`, 单个参数的情况括号也可省略.

    ```javascript
    function func1(a) {
      return a + 1;
    }

    var func1 = a => a + 1;
    ```

2. 优点:箭头函数不会创建自己的上下文(context), 意味着函数内 `this` 和箭头函数所定义的上下文一样.

    ```javascript
    var _this = this;
    axios.get(api).then(function(res){
      _this.model = res.data;
    });

    // 无需 _this 或者 bind 传递 this
    axios.get(api).then(res => {
      this.model = res.data;
    })
    ```

3. 技巧: 返回对象, 需要在对象外层加括号 (对象大括号会被解析为函数体).

    ```javascript
    // 错误
    var func1 = a => {a: a};
    console.log(func1(a));

    // 正确
    var func1 = a => ({a: a});
    console.log(func1(a));
    ```

4. 技巧: 通过 `||` 添加日志, 而不用单独一行输出日志.

    ```javascript
    a => {
      console.log(a);
      return {
        a: a
      }
    }

    a => console.log(a) || ({
      a: a
    });
    ```

- [Arrow Functions in JavaScript](https://tylermcginnis.com/arrow-functions/)

## 文档对象 DOM

### 浏览器事件冒泡和捕获

事件分为三个阶段:

- 捕获阶段
- 目标阶段
- 冒泡阶段

TODO：IE 和 w3c 标准的区别；阻止事件传播(捕获，冒泡) `e.stopPropagation()`；阻止事件默认行为 `e.preventDefault()`。

```javascript
function registerEventHandler(node, event, handler) {
  if (typeof node.addEventListener == "function")
    node.addEventListener(event, handler, false);
  else
    node.attachEvent("on" + event, handler);
}

registerEventHandler(button, "click", function(){print("Click (2)");});
```

- [本期节目, 浏览器事件模型中捕获阶段、目标阶段、冒泡阶段实例详解, segmentfault, 2015.8](http://segmentfault.com/a/1190000003482372)

## 浏览器对象 BOM

### 弹框

- `prompt(text,defaultText)` 提示用户输入的对话框。`text` 对话框中显示的纯文本，`defaultText` 默认的输入文本。返回值为输入文本。
- `alert(message)` 警告框。`message` 对话框中要实现的纯文本。
- `confirm(message)` 显示一个带有指定消息和 OK 及取消按钮的对话框。`message` 对话框中显示的纯文本。点击确认返回 true，点击取消返回 false。

- <http://www.w3school.com.cn/jsref/met_win_prompt.asp>

### localStorage

> 存储在浏览器中的数据，如 localStorage 和 IndexedDB，以源进行分割。每个源都拥有自己单独的存储空间，一个源中的Javascript脚本不能对属于其它源的数据进行读写操作。

localStorage 在当前源下设置的值，只能在当前源下查看。

```javascript
localStorage.setItem('key',value)   // 设置值, 或 localStorage.key = value
localStorage.getItem('key')         // 获取值, 或 localStorage.key
localStorage.removeItem('key')      // 删除值
localStorage.clear()                // 清空 localStorage
```

- [JavaScript 的同源策略, MDN](https://developer.mozilla.org/zh-CN/docs/Web/Security/Same-origin_policy)
- [localStorage, MDN](https://developer.mozilla.org/en-US/docs/Web/API/Storage/LocalStorage)
- [杜若, localStorage 介绍](http://wikieswan.github.io/javascript/2015/04/03/html5-api-localstorage/)

## jQuery

### jQuery 知识结构

- jQuery 基础: 选择器
- jQuery 效果: hide, show, toggle, fadeIn, fadeOut, animate
- jQuery 操作 HTML: text, html, val, attr, append, after, prepend, before, remove, empty
- jQuery 遍历 Dom: parent, parents, children, find

### jQuery 和 Dom 对象相互转换

1. jQuery 对象转换成 Dom 对象: 下标和 get 方法

    ```javascript
    /* 方法一: 下标 */
    var $v = $("#v") ; //jQuery对象
    var v  = $v[0];    //DOM对象

    /* 方法二: get */
    var $v = $("#v");   //jQuery对象
    var v  = $v.get(0); //DOM对象
    ```

2. Dom 对象转 jQuery 对象: 通过 `$()` 把 Dom 对象包装起来实现

    ```javascript
    var v  = document.getElementById("v"); //DOM对象
    var $v = $(v); //jQuery对象
    ```

- [jQuery对象与dom对象的区别与相互转换](http://segmentfault.com/a/1190000003710344)

### jQuery 命名冲突解决

1. 使用 `jQuery.noConflict()`

    ```javascript
    jQuery.noConflict();
    // 之后使用 jQuery 调用, jQuery("#id").methodname()
    ```

2. 自定义别名

    ```javascript
    var $j = jQuery.noConflict();
    // $j("#id").methodname();
    ```

3. 传入参数，继续使用 `$`

    ```javascript
    jQuery.noConflict();
    (function($){
        $("#id").methodname();
    })(jQuery)
    ```

- [邦彦, 谈谈 jQuery 中的防冲突（noConflict）机制, TaoBaoUED](http://ued.taobao.org/blog/2013/03/jquery-noconflict/)
- [RascallySnake, Jquery的$命名冲突, cnblogs](http://www.cnblogs.com/RascallySnake/archive/2010/05/07/1729417.html)
- [TerryChen, Jquery命名冲突解决的五种方案, cnblogs](http://www.cnblogs.com/ForEvErNoME/archive/2012/03/15/2398659.html)

## 大数

JS 正常处理的最大的数字为 53 位。

```javascript
console.log(Math.pow(2, 53));
// 9007199254740992
console.log(Math.pow(2, 53) + 1)
// 9007199254740992
```

### 场景

有时候后端返回来字段的不是字符串（通常是 ID），而是数字，然后后面又要用到这个字段，那么需要提前转换成字符串 `String(1152921504606847000)`，避免数字变更成其他值。

## 其他

1. switch 以 `===` 匹配。
2. 函数会首先被提升，然后才是变量。
