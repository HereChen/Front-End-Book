# Array

> [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

## 改变原数组

* `array.pop()` 移除最后一个元素。
* `array.push(item...)` 将一个或多个参数附加到数组的尾部。
* `array.reverse()` 反转 array 元素的顺序。
* `array.sort(camprefn)` 数组排序。
* `array.shift()` 移除数组中的第一个元素并返回该元素。
* `array.splice(start, deleteCount, item)` 从 array 中移除一个或多个元素并用新的 item 替换他们。
* `array.copyWithin(target, start, end)` 将 start 到 end（可选）的元素复制到 target 位置（会覆盖原有的元素）。

## 不改变原数组

* `array.concat(item...)` 产生一个新数组，它包含一份 array 的前复制，并把一个或多个参数 item 附加在其后面。
* `array.join(separator)` join 方法把一个 array 构成一个字符串。它先把 array 中的每个元素构造成一个字符串，接着用一个 separator 分隔符把它们连接在一起。
* `array.map(item => )` 数组映射, 依次处理数组中的每一项.
* `array.filter(item => )` 数组过滤, 保存返回为真的项.
* `array.reduce(callback(previousValue,currentValue,index,array))` 累加器。
* [forEach(callback(currentValue[, index[, array]]){})](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach), 循环。
* [some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some), 是否有某个元素满足条件(回掉返回true).
* [every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every), 是否全部元素满足条件。
* `array.slice([begin[, end]])` 复制数组的部分元素, 通过 begin 和 end 标识开始和结束下标.

## 扩展阅读

* [Stable Array.prototype.sort, https://v8.dev, 2019-07-02](https://v8.dev/features/stable-sort)
