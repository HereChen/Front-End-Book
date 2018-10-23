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

`src/index.js`

```javascript
import React from "react";
import ReactDOM from "react-dom";

const App = () => {
  return <h1>Hello World! HOT</h1>;
};

ReactDOM.render(<App />, document.getElementById("root"));
```

`src/index.html`

```html
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>APP</title>
</head>
<body>
    <div id="root"></div>
    <script src="./index.js"></script>
</body>
</html>
```
