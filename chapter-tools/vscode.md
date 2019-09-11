# Visual Studio Code

> 主页：<https://code.visualstudio.com>。应用市场：<https://marketplace.visualstudio.com/VSCode>。

## 常用快捷键

以下是 Winidows 上的。更多快捷键可查看 [Keyboard shortcuts for Winidows](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)、[Keyboard shortcuts for macOS](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf)、[Keyboard shortcuts for Linux](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)。

快捷键 | 功能
-----  | -----
`Ctrl + B` | 显示隐藏资源管理侧边栏
`Ctrl + X` | 打开 Extensions
`Ctrl + Shift + G G` | 打开 Source Control
`Ctrl + Shift + E` | 打开 Explorer
`Ctrl + Shift + F` | 全文搜索
`Ctrl + F2` | 全选当前选中文本
`Shift + Alt + Right Arrow` | 选中括号或引号之间的内容
`Ctrl + K W` | 关闭全部编辑窗口

## 常用命令

保证`code` 命令路径在环境变量中的前提下（Windows中示例`C:\Users\chenl\AppData\Local\Programs\Microsoft VS Code\bin`），可使用以下命令。需要注意，Insiders 版本，命令不一样，不是`code`，可自行更改执行文件的文件名。

```bash
# 打开当前文件夹
code .

# 在当前窗口打开工程(覆盖已经打开的窗口)
code -r folder

# install extension
# 应用商店搜索进入详情页面，可找到扩展 ID
# 例如 https://marketplace.visualstudio.com/items?itemName=octref.vetur
code --install-extension octref.vetur

# uninstall extension
code --uninstall-extension octref.vetur
```

命令行的更多用法可查看[Command Line Interface (CLI)](https://code.visualstudio.com/docs/editor/command-line)。

## 配置

配置都是非必须的，根据需要进行配置。下面是一份常用配置，`Ctrl + Shift + P`，选择`Open User Settings` 进行配置。

```json
{
  // LF 换行
  "files.eol": "\n",
  // TAB 替换为两个空格
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  // 文本显示不下，自动换行
  "editor.wordWrap": "on",
  // 编辑器失去焦点后保存
  "files.autoSave":"onFocusChange",
  // git 路径（可省略）
  "git.path": "C:\\Program Files\\Git\\bin\\git.exe",
  // 配置 WSL 终端
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\wsl.exe",
  // 主题
  "workbench.colorTheme": "One Dark Pro Vivid",
  // 字体
  "editor.fontFamily": "Fira Code, Consolas, Noto Sans CJK SC, 'Courier New', monospace",
  // 隐藏了左侧菜单，用的快捷键
  "workbench.activityBar.visible": false
}
```

## Vue.js 配置

**代码高亮** 安装 Vetur 扩展。

```bash
code --install-extension octref.vetur
```

**ESLint 配置** 配置成自动修复 JavaScript 代码风格问题。需要配置工作空间（`Open Workspace Settings`），或者新建文件`.vscode/settings.json`。

```json
{
  "eslint.enable": true,
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
    }
  ]
}
```
