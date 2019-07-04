# this

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

refer:

1. [你不知道的JavaScript（上卷）](http://book.douban.com/subject/26351021/)
2. [JavaScript忍者秘籍, p52](https://book.douban.com/subject/26638316/)
