# 编码时检测代码兼容性【未实践】

编码时就检测兼容性并及时修改问题，相对于完成后在浏览器中测试出问题再修改，要简单得多。实现得基本思路是，定义需要兼容得浏览器版本（也可以是其他平台，比如 Node.js），然后检测工具根据定义得浏览器检测代码是否兼容。

**定义浏览器列表** 选择需要兼容的浏览器版本。

* [Browserslist](https://github.com/browserslist/browserslist)

**JS 兼容性检测** 与 ESLint 结合使用。

* [ESLint](https://github.com/eslint/eslint)
* [eslint-plugin-compat](https://github.com/amilajack/eslint-plugin-compat)

**CSS 兼容性检测** 与 stylelint 结合使用。

* [stylelint](https://github.com/stylelint/stylelint)
* [stylelint-no-unsupported-browser-features](https://github.com/ismay/stylelint-no-unsupported-browser-features)

**HTML 兼容性检测** 没找到与 Browserslist 配套的工具。