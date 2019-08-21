# 通信

建立长连接 (long-lived connection) 有以下几种方式：

1. HTTP [Long Polling](https://en.wikipedia.org/wiki/Push_technology#Long_Polling)，应用 [XHR](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) 或 [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) 实现。客户端请求后，保持连接，等待服务端响应数据后重新发起新的请求。
2. [Server-sent events](https://html.spec.whatwg.org/multipage/server-sent-events.html#server-sent-events)，基于 HTTP 的一种技术，应用 [EventSource](https://developer.mozilla.org/en-US/docs/Web/API/EventSource) 实现。适用于服务端向客户端推送数据，比如统计数据需要实时更新。
3. [WebSocket](https://tools.ietf.org/html/rfc6455)，应用 [WebSocket API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)，一种双向通信协议，适用于客户端和服务端需要交互的场景，比如聊天。

以上方法都是建立再 TCP 之上，WebRTC 还会涉及到 UDP。

## 资源

* [Build Real-time Apps by Learning WebSockets, Ian Wilson, https://dev.to, 2018-05-22](https://dev.to/iwilsonq/build-real-time-apps-by-learning-websockets-3c9m)
* [Building Real-time Apps with Websockets & Server-Sent Events, Mark Brown, https://www.sitepoint.com, 2016-06-06](https://www.sitepoint.com/real-time-apps-websockets-server-sent-events/)
