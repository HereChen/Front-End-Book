# 代码规范

## 编辑器文本规范

规范文件采用的换行符、缩进方式以及编码等等.

1. EditorConfig: <http://editorconfig.org/>
2. VSCode 插件: [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig), 可生成配置样本.

`.editorconfig`配置样例

```
root = true

[*]
indent_style = space
indent_size = 2
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
max_line_length = 80
```

## 命名规范

### CSS 命名

1. [BEM](http://getbem.com/), Block Element Modifier.
2. [SMACSS](https://smacss.com/), Scalable and Modular Architecture for CSS.
3. [OOCSS](http://oocss.org/), Object-Oriented CSS.
4. [Atomic CSS](https://acss.io/).

## 代码检查

### CSS 格式化

1. CSScomb: <http://csscomb.com>
2. 配置文件`.csscomb.json` 示例:<https://github.com/htmlacademy/codeguide/blob/master/csscomb.json>
3. VSCode 插件: [CSScomb](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-csscomb)

### JS 静态代码检查工具

1. ESLint: <https://github.com/eslint/eslint>
2. JSLint: <https://github.com/jshint/jshint/>

### JS 语法规范

1. airbnb: <https://github.com/airbnb/javascript>
2. standard: <https://github.com/standard/standard>

## 扩展

1. [贺师俊, Myths of CSS Frameworks, 2015](http://johnhax.net/2015/myth-of-css-frameworks/)
2. [白牙, [译]结合智能选择器的语义化的CSS, 2013-10-06](https://www.w3cplus.com/css/semantic-css-with-intelligent-selectors.html)
