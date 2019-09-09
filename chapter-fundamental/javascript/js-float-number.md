# 数字

JS 正常处理的最大的数字为 53 位。

```javascript
var maxNumber = Math.pow(2, 53) - 1; // 9007199254740991
var isTrue = maxNumber === Number.MAX_SAFE_INTEGER;
console.log(isTrue);
// true

console.log(maxNumber + 1)
// 9007199254740992

// 判断是否在 Number.MIN_SAFE_INTEGER 到 Number.MAX_SAFE_INTEGER 范围内
console.log(Number.isSafeInteger(maxNumber + 1));
// false
```

## 大数字转换成字符串

**通过 `String` 转换** 有时候后端返回来字段的不是字符串（通常是 ID），而是数字，然后后面又要用到这个字段，那么需要提前转换成字符串 `String(1152921504606847000)`，避免数字变更成其他值。用 `String` 而不是 `toString()`，是由于如果用后者，还需要对变量作判断，如果是 `null` 或 `undefined` 程序会报错。

**采用工具批量转换 [`json-bigint`](https://github.com/sidorares/json-bigint)** 比如，如果后端接口返回的比较长的数字不是字符串，这时候就可以在请求工具中统一处理。对于后端接口返回的数据，最好还是后端处理成字符串，避免给前端带来性能负担。

```javascript
import JSONbig from "json-bigint";

const request = axios.create({
    // ...
    transformResponse: data =>
        data && JSONbig({ storeAsString: true }).parse(data)
});
```

值得注意的是，之前发现 Firefox 有个问题，在 Network 响应的 Preview 中看到的接口返回的大数字都已经改变了，应该在 Response payload 中查看后端返回的原始数据。

## 数字计算

1. [MikeMcl/big.js](https://github.com/MikeMcl/big.js/)
