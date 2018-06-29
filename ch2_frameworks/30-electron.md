# Electron

Electron 构建应用，主要包括两部分：一是构建 Web App；二是 Electron 提供扩展能力（内置了 Node，可用 node 的模块），Web App 实现本地交互能力。构建 Electron 应用工程，可首先构建 Web App 工程，稍作修改适应客户端最后打包的需求。

## 技术栈

应用(TypeScript + React) + 打包(electron-builder)

思路，首先建立一个 Web APP 工程（通常为单页应用，无需管理多窗口），然后建一个桌面应用入口文件，入口文件加载 Web App 应用，最后用工具将 electron 和 Web App 打包在一起。

创建工程流程，可先用 create-react-app 创建 React 应用工程，然后作调整，并加入 Electron 相关依赖的脚本。

```bash
create-react-app my-app --scripts-version=react-scripts-ts
```

1. 更改 tsconfig：解决 main.ts 编译问题

    ```json
    {
        "compilerOptions": {
            "module": "commonjs",
            // 关闭窗口时设置为 null 禁用 null 检查
            "strictNullChecks": false
        }
    }
    ```

2. 静态资源路径需要改为相对路径。
3. 将 electron-quick-start-typescript 中的 main.ts 移到当前工程 `src` 下。

注意 main.ts 编译后 index.html 以及静态资源路径问题。

## 资源及扩展阅读

1. [electron-quick-start-typescript](https://github.com/electron/electron-quick-start-typescript)。
2. [TypeScript-React-Starter](https://github.com/Microsoft/TypeScript-React-Starter)
3. [Technical Differences Between Electron and NW.js(formerly node-webkit)](https://electronjs.org/docs/development/atom-shell-vs-node-webkit)