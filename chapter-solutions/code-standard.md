# 代码规范

## 编辑器文本规范

规范文件采用的换行符、缩进方式以及编码等等.

1. EditorConfig: <http://editorconfig.org/>
2. VSCode 插件: [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig), 可生成配置样本.

`.editorconfig`配置样例

```properties
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

1. [CSScomb](https://github.com/csscomb/csscomb.js)
2. 配置文件`.csscomb.json` 示例:<https://github.com/htmlacademy/codeguide/blob/master/csscomb.json>
3. VSCode 插件: [CSScomb](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-csscomb)

### JS 静态代码检查工具

* [ESLint](https://github.com/eslint/eslint)
* [JSLint](https://github.com/jshint/jshint)
* [Prettier](https://github.com/prettier/prettier)
* [TSLint](https://github.com/palantir/tslint)，2019 年将废弃，合并到 ESLint，参阅 [Roadmap: TSLint -> ESLint #4534](https://github.com/palantir/tslint/issues/4534)。

### JS 语法规范

1. airbnb: <https://github.com/airbnb/javascript>
2. standard: <https://github.com/standard/standard>

## 不同文件夹应用不同的 ESLint 配置文件

> [Configuration Cascading and Hierarchy](https://eslint.org/docs/user-guide/configuring#configuration-cascading-and-hierarchy)

在有代码移植时，这个方法能够避免因代码风格配置冲突而修改移植代码。比如需要应用另外一个项目的代码，并且希望保留该项目的 ESLint 配置，从而避免与当前项目的配置冲突，导致需要大量更改移植过来代码的代码风格问题。多个 ESLint 配置文件有如下几个关键点：

1. **父文件夹与子文件夹的配置应用顺序** 父文件夹的配置将应用于所有子文件夹；相同的配置，则优先应用子文件夹的配置（用最近的配置）；不同的配置，同时应用。
2. **禁用父文件夹的配置** 如下配置时，则不会查找父文件夹的配置，而只应用当前的配置。

    ```json
    {
      "root": true
    }
    ```

## 阅读

* [贺师俊, Myths of CSS Frameworks, 2015](http://johnhax.net/2015/myth-of-css-frameworks/)
* [白牙, [译]结合智能选择器的语义化的CSS, 2013-10-06](https://www.w3cplus.com/css/semantic-css-with-intelligent-selectors.html)
