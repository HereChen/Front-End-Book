# 异步请求

## Ajax (Asynchronous Javascript And XML)

### XMLHttpRequest

1. 原生 Ajax 实现: GET

    ```javascript
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","test1.txt",true);
    xmlhttp.send();
    ```

2. 原生 Ajax 实现: POST

    ```javascript
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function(){
      if (xmlhttp.readyState==4 && xmlhttp.status==200){
        document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
      }
    }
    xmlhttp.open("POST","ajax_test.asp",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send("fname=Bill&lname=Gates");
    ```

- [原生JS与jQuery对AJAX的实现](http://segmentfault.com/a/1190000003096293)
- [AJAX - 向服务器发送请求](http://www.w3school.com.cn/ajax/ajax_xmlhttprequest_send.asp)

### XMLHttpRequest 的5个状态

新建对象 -> 建立连接 -> 接收响应原始数据 -> 解析原始数据 -> 响应就绪(待后续处理)

1. 0: 请求未初始化

    此阶段确认 XMLHttpRequest 对象是否创建，并为调用 open() 方法进行未初始化作好准备。值为 0 表示对象已经存在，否则浏览器会报错－－对象不存在。

2. 1: 服务器连接已建立

    此阶段对 XMLHttpRequest 对象进行初始化，即调用 open() 方法，根据参数 (method,url,true)完成对象状态的设置。并调用 send() 方法开始向服务端发送请求。值为 1 表示正在向服务端发送请求。

3. 2: 请求已接收

    此阶段接收服务器端的响应数据。但获得的还只是服务端响应的原始数据，并不能直接在客户端使用。值为2表示已经接收完全部响应数据。并为下一阶段对数据解析作好准备。

4. 3: 请求处理中

    此阶段解析接收到的服务器端响应数据。即根据服务器端响应头部返回的MIME类型把数据转换成能通过 responseBody、responseText 或 responseXML 属性存取的格式，为在客户端调用作好准备。状态 3 表示正在解析数据。

5. 4: 请求已完成，且响应已就绪

    此阶段确认全部数据都已经解析为客户端可用的格式，解析已经完成。值为 4 表示数据解析完毕，可以通过 XMLHttpRequest 对象的相应属性取得数据。

- [Panda, Ajax readyState的五种状态, LOFTER](http://blog.163.com/freestyle_le/blog/static/183279448201269112527311/)

## Fetch

**fetch 和 Ajax (`jQuery.ajax()`)的区别**

> - The Promise returned from `fetch()` **won’t reject on HTTP error status** even if the response is an HTTP 404 or 500. Instead, it will resolve normally (with ok status set to false), and it will only reject on network failure or if anything prevented the request from completing.
> - By default, `fetch` **won't send or receive any cookies** from the server, resulting in unauthenticated requests if the site relies on maintaining a user session (to send cookies, the credentials init option must be set).

```javascript
fetch(api, config)
.then(response => response.json())
.then(data => {
  // handle
})
.catch(err => console.error(err));
```

- [Using Fetch, MDN web docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)
