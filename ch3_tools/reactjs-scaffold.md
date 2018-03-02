# parcel 与 React 搭建项目

[parcel](https://github.com/parcel-bundler/parcel) 支持热加载、source map、code split (需要按既定格式书写代码).

## 基础

1. 初始化项目

    ```bash
    npm init -y
    ```

2. 安装资源依赖: react 相关依赖

    ```bash
    npm i --save react react-dom
    ```

3. 安装工具依赖: parcel

    ```bash
    npm i --save-dev parcel-bundler
    ```

4. 启动命令: `npm run start`

    ```json
    "scripts": {
      "start": "parcel src/index.html"
    }
    ```
