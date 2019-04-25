# Visual Studio Code

1. 主页: <https://code.visualstudio.com/>
2. 快捷键: <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf>

## 基本用法

1. 命令搜索工具: `F1`.
2. 扩展安装: `ext install extensionname`

## Vue.js 配置

### 代码高亮

1. 安装 Vetur 扩展.

### ESLint 问题自动修复

```json
{
  "eslint.enable": true,
  "eslint.run": "onType",
  "eslint.autoFixOnSave": true,
  "eslint.alwaysShowStatus": true,
  "eslint.validate": [{
      "language": "html",
      "autoFix": true
    },
    {
      "language": "vue",
      "autoFix": true
    },
    {
      "language": "javascript",
      "autoFix": true
    },
    {
      "language": "javascriptreact",
      "autoFix": true
    }
  ]
}
```
