## 正则表达式

### 参数

- `i`, 忽略大小写.
- `g`, 全局匹配, 找到所有匹配，而不是在第一个匹配后停止.

```javascript
// 替换所有 a 字符, 不区分大小写
"aAopa".replace(/a/gi, '')
```

### 特殊字符

- `\d` 任意一个数字，等价于 `[0-9]`
- `\D` 任意一个非数字，等价于 `[^0-9]`
- `\w` 任意一个字母、数字或下划线字符，等价于 `[a-zA-Z_]`
- `\W` 任意一个非字母、数字和下划线字符，等价于 `[^a-zA-Z_]`
- `\s` 任意一个空白字符，包括换页符、换行符、回车符、制表符和垂直制表符，等价于 `[\f\n\r\t\v]`
- `\S` 任意一个非空白符，等价于 `[^\f\n\r\t\v]`
- `.` 换行和回车以外的任意一个字符，等价于 `[^\n\r]`

### 次数匹配

- `?` 最多一次 (零次或一次)
- `+` 至少一次
- `*` 任意次
- `{n}` 只能出现 n 次
- `{n,m}` 至少 n 次，最多 m 次

### reference

- [mozilla, RegExp](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
- [正则总结：JavaScript中的正则表达式](http://www.nowamagic.net/librarys/veda/detail/1283)
