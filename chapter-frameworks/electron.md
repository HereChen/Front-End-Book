# Electron

> <https://github.com/electron/electron>

Electron 构建应用，主要包括两部分：一是构建 Web App；二是 Electron 提供扩展能力（内置了 Node，可用 node 的模块），Web App 实现本地交互能力。构建 Electron 应用工程，可首先构建 Web App 工程，稍作修改适应客户端最后打包的需求。

## 技术栈

应用(TypeScript + React) + 打包(electron-builder)。

### 准备

1. Electron 支持 TypeScript，[Announcing TypeScript support in Electron](https://electronjs.org/blog/typescript)，模板工程参考 [electron-quick-start-typescript](https://github.com/electron/electron-quick-start-typescript)。
2. React TypeScript 模板工程参考 [TypeScript-React-Starter](https://github.com/Microsoft/TypeScript-React-Starter)。
3. 打包工具 [electron-builder](https://github.com/electron-userland/electron-builder)。

思路，首先建立一个 Web 应用工程（通常为单页应用，无需管理多窗口），然后建一个桌面应用入口文件，入口文件加载 Web App 应用，最后用工具将 electron 和 Web 应用打包在一起。结合以上的两个模板工程，优先构建 Web 应用，然后加入 Electron 相关依赖的脚本。

### 工程搭建

创建工程流程，可先用 create-react-app 创建 React 应用工程，然后作调整，并加入 Electron 相关依赖的脚本。

1. 创建 React 工程

    ```bash
    create-react-app my-app --scripts-version=react-scripts-ts
    ```

2. 更改 tsconfig：解决 main.ts 编译问题

    ```javascript
    {
        "compilerOptions": {
            "module": "commonjs",
            /* 关闭窗口时设置为 null 禁用 null 检查 */
            "strictNullChecks": false
        }
    }
    ```

3. 静态资源路径需要改为相对路径。
4. 将 electron-quick-start-typescript 中的 main.ts 移到当前工程 `src` 下。

注意 main.ts 编译后 index.html 以及静态资源路径问题。

## 阅读

* [Technical Differences Between Electron and NW.js(formerly node-webkit)](https://electronjs.org/docs/development/atom-shell-vs-node-webkit)
