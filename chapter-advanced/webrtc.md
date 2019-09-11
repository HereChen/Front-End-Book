# WebRTC

> [WebRTC 1.0: Real-time Communication Between Browsers](https://www.w3.org/TR/webrtc/)

WebRTC 顾名思义，主要包括两个部分：连接的建立、数据（文本，音视频）的传输。其特点是，可实现P2P的通信，多端可用（Web、iOS、Android等，见[Architecture](https://webrtc.org/architecture/)）。可应用于音视频会议、聊天、数据传输等。

连接的建立，依赖于[RTCPeerConnection](https://www.w3.org/TR/webrtc/#rtcpeerconnection-interface)。建立P2P的连接，因为需要”打洞“，涉及的技术为ICE，可以理解为一套解决方案，包含[NAT（Network Address Translation）](https://tools.ietf.org/html/rfc2663)、[STUN（Session Traversal Utilities for NAT）](https://tools.ietf.org/html/rfc5389)、[TURN（Traversal Using Relays around NAT）](https://tools.ietf.org/html/rfc6062)等技术。”打洞“就是让内部设备可以和外部的设别通信，对于本来不可访问的设备，通过地址映射到可以访问的地址上，这个映射的标准就是NAT。STUN为”打洞“提供工具，TURN为”打洞“失败提供中转服务器（失败情况下仍然可以通信）。

```js
// ICE 服务器配置示例
configuration = {
  iceServers: [
    {urls: 'stun:stun.services.mozilla.com'},
    {urls: 'stuns:stun.services.mozilla.com'},
    {
      urls: 'turn:turn.example.org',
      username: "webrtc",
      credential: "turnpassword"
    },
    {
      urls: 'turns:turn.example.org',
      username: "webrtc",
      credential: "turnpassword"
    }
  ]
};
new RTCPeerConnection(configuration);
```

数据传输的接口[RTCDataChannel](https://www.w3.org/TR/webrtc/#rtcdatachannel)。音视频资源的获取有专门的规范。

## 资源

* STUN 服务器：<http://olegh.ftp.sh/public-stun.txt>，<https://gist.github.com/zziuni/3741933>。
* React Native 依赖：[react-native-webrtc](https://github.com/react-native-webrtc/react-native-webrtc)
