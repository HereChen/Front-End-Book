# 依赖版本锁定

场景举例：在公司的电脑上打包发布正常，在家打包发布出现兼容性错误。原因是两台电脑上安装的二级依赖的版本不同，家里的电脑安装了新的依赖版本，引入了兼容性错误。

依赖版本锁定的目的，就是避免依赖版本意外变更带来的风险。

## 方案

**未锁定版本前** 下面这种形式，有小版本更新时，`npm install` 会安装新的版本；二级依赖同理。

```json
{
  "dependencies": {
    "axios": "^0.19.0"
  }
}
```

**锁定版本方案**

* `.npmrc`

  ```plaintext
  package-lock = true
  ```

* `package-lock.json` 加入版本管理。
* `package.json` 固定依赖版本。

  ```json
  {
    "dependencies": {
      "axios": "0.19.0"
    }
  }
  ```

## 资源

* [npm-package-locks](https://docs.npmjs.com/files/package-locks)

  > Once it’s present, any future installation will base its work off this file, instead of recalculating dependency versions off package.json.

* 参考库 [jitsi/jitsi-meet/package.json](https://github.com/jitsi/jitsi-meet/blob/35e88216799cc5608144050062ff304dfc5c41a3/package.json)
