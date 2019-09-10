# Webpack

> [webpack/webpack](https://github.com/webpack/webpack)

Webpack 是打包工具, 以 JavaScript 作为入口文件开始解析.

**公共文件/组件抽离 (CommonsChunkPlugin)**

> [list of plugins](https://github.com/webpack/docs/wiki/list-of-plugins#commonschunkplugin)

## 阅读

* [Loading css, css-modules, and Sass with webpack, 2019-05-13](https://adamrackis.dev/css-modules/)

    描述如何配置 Webpack, 从而可以让全局 CSS (对所有页面生效, 或者可以引用 CSS var) 和 CSS Modules 都可以被正常解析.

    ```bash
    npm i node-sass sass-loader --save
    ```

    ```js
    {
      test: /\.s?css$/,
      oneOf: [
        {
          // CSS Modules
          // style.module.css, style.module.scss
          test: /\.module\.s?css$/,
          use: [
            MiniCssExtractPlugin.loader,
            {
              loader: "css-loader",
              options: { modules: true, exportOnlyLocals: false }
            },
            "sass-loader"
          ]
        },
        {
          // 全局样式
          use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
        }
      ]
    };
    ```
