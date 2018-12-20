# 时间格式问题

## iOS 时间无法解析

由于不同平台的时间格式支持上的原因, 在 IOS 上会出现时间解析失败的情形.

```javascript
console.log(new Date('2017-10-16 00:00:00'))
// Invalid Date
console.log(Date.parse('2017-10-16 00:00:00'))
// NAN
```

为了适配各个平台, 可采用以下做法.

```javascript
var arr = '2017-10-16 00:00:00'.split(/[- :]/),
    date = new Date(arr[0], arr[1]-1, arr[2], arr[3], arr[4], arr[5]);
console.log(date);
```
