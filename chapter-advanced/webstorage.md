# Web 存储

> <https://html.spec.whatwg.org/multipage/webstorage.html>

## cookie

**类型** 根据是否设置过期时间 (Expires, Max-Age) 可分两类 ([HTTP cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies))。

* Session cookie. 未设置过期时间, 浏览器关闭后会删除 (存储在内存, 还是临时文件?).
* Permanent cookie. 设置了过期时间, 被存储为一个文件.

**存储位置** Firefox 和 Chrome 的 Cookie 被存储为一个 SQLite 文件 (所有页面的 Cookie), 存放于用户数据文件夹. 例如, Firefox Nightly 的 Cookie 文件路径 (Windows)：`%APPDATA%\Mozilla\Firefox\Profiles\td8g4e5i.default-nightly\cookies.sqlite`，[Cookies - Information that websites store on your computer](https://support.mozilla.org/en-US/kb/cookies-information-websites-store-on-your-computer)。

## indexedDB

## localStorage

## sessionStorage
