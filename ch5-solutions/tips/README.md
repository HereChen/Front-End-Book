# Tips

## `&&` 和 `||`

取一个对象的某个属性.

```javascript
// obj 不存在时会报错
const val1 = obj.attr1;

// 推荐, obj 存在时会取 && 右侧的值
const val2 = obj && obj.attr1;
```

当一个变量不存在时, 取一个默认值.

```javascript
// param 为 false, '', null 等值为假的情况需谨慎使用
const val1 = param || '';
```

## HTTP 状态及提示
