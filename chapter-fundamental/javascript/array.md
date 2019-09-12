# Array

> [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

## 常用方法

**改变原数组的方法** 调用方法后原数组会改变。

```js
// pop
// 移除最后一个元素，返回移除的元素
a = [1, 2, 3, 4];
a.pop(); // a -> [1, 2, 3]

// push
// 将一个或多个参数附加到数组的尾部，返回数组长度
a = [1, 2, 3, 4];
a.push(1); // a -> [1, 2, 3, 4, 1]
a.push(1, 2, 0); // a -> [1, 2, 3, 4, 1, 1, 2, 0]

// reverse
// 反转数组元素顺序
a = [1, 2, 3, 4];
a.reverse(); // a -> [4, 3, 2, 1]

// shift
// 移除第一个元素，返回移除的元素
a = [1, 2, 3, 4];
a.shift(); // [2, 3, 4]

// splice
// 元素删除，返回被删除的元素
// splice(start, deleteCount, item)
a = [1, 2, 3, 4];
a.splice(1); // 删除第一个元素之后的所有元素 a -> [1]
// a.splice(1, 2); // 删除第一个元素之后的两个元素 a -> [1, 4]
// a.splice(1, 2, 5, 6); // 替换删除的元素 a ->  [1, 5, 6, 4]

// sort
// 数组排序
a = [1, 2, 3, 4];
a.sort(); // 升序排列

// copyWithin(target, start, end)
// 将 start 到 end（可选）的元素复制到 target 位置（会覆盖原有的元素）
```

**不改变原数组的方法** 调用方法后原数组不会改变，如果需要获取操作后的结果，需要重新赋值。

* `find` 查找满足条件的元素。
* `findIndex` 查找满足条件的元素的下标。
* `concat(item...)` 产生一个新数组，它包含一份 array 的前复制，并把一个或多个参数 item 附加在其后面。
* `join(separator)` join 方法把一个 array 构成一个字符串。它先把 array 中的每个元素构造成一个字符串，接着用一个 separator 分隔符把它们连接在一起。
* `reduce` 累加器。
* `filter` 数组过滤，保存满足条件的元素。
* `some` 是否有某个元素满足条件（回掉返回true），返回 `true` 即停止继续循环查找，可实现类似 `break` 的功能。
* `every` 是否全部元素满足条件。
* `map` 数组映射，依次处理数组中的每一项。比如可以用于 HTTP 接口字段映射为实际需要的字段。
* `forEach` 循环，此方法没办法 `break`。
* `slice` 复制数组的部分元素，通过 begin 和 end 标识开始和结束下标。

## 阅读

* [Stable Array.prototype.sort, https://v8.dev, 2019-07-02](https://v8.dev/features/stable-sort)

    问题：对象数组，根据其中一个字段排序后，可能得到不同的排序结果。问题解决：[[Normative] Make Array.prototype.sort stable](https://github.com/tc39/ecma262/pull/1340)
