# npm

## 命令

```bash
# 以下相邻的两条命令作用一样

# 安装依赖到 dependencies （通常是业务依赖）
npm i module_name -S
npm install module_name --save

# 安装依赖到 devDependencies （通常是开发工具类的依赖）
npm i module_name -D
npm install module_name --save-dev

# 安装全局包（比如 vue-cli，creare-react-app）
npm i module_name -g
npm install module_name --global
```

## .npmrc

### 配置镜像

```bash
# 工程里面配置淘宝镜像
mkdir .npmrc

# .npmrc 文件内添加
# registry = https://registry.npm.taobao.org
# # 或者 registry = https://registry.npm.org
```
