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

## 场景

有时候后端返回来字段的不是字符串（通常是 ID），而是数字，然后后面又要用到这个字段，那么需要提前转换成字符串 `String(1152921504606847000)`，避免数字变更成其他值。
