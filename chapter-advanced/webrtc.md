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

## 会话描述协议

> [JavaScript Session Establishment Protocol](https://tools.ietf.org/html/draft-ietf-rtcweb-jsep-26)

**SDP 样本** 来源于 <https://meet.jit.si> 本地 SDP。

```plantext
v=0
o=mozilla...THIS_IS_SDPARTA-71.0a1 4835103325855434045 0 IN IP4 0.0.0.0
s=-
t=0 0
a=sendrecv
a=fingerprint:sha-256 20:ED:AC:B7:79:8F:3C:48:30:50:81:65:FA:F7:00:F8:93:E4:67:8B:58:C2:C7:14:73:AA:3F:46:5B:A4:E8:DC
a=ice-options:trickle
a=msid-semantic: WMS *
a=group:BUNDLE audio video
m=audio 50389 RTP/SAVPF 111 126
c=IN IP4 54.214.212.235
a=rtpmap:111 opus/48000/2
a=rtpmap:126 telephone-event/8000
a=fmtp:111 maxplaybackrate=48000;stereo=1;useinbandfec=1
a=fmtp:126 0-15
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=setup:active
a=mid:audio
a=sendrecv
a=ice-ufrag:52ac8f74
a=ice-pwd:de76bcb464d09066e208e353d3f5a45d
a=candidate:0 1 UDP 2121990399 172.23.16.81 55131 typ host
a=candidate:1 1 UDP 2122121471 fd20:8ed:735c:1700:c38:d760:eb13:6d80 55132 typ host
a=candidate:2 1 UDP 2122187007 fd20:8ed:735c:1700:8576:1891:96b1:c1fc 55133 typ host
a=candidate:3 1 UDP 2122055935 192.168.100.168 55134 typ host
a=candidate:4 1 UDP 2122252543 172.17.31.49 55135 typ host
a=candidate:5 1 TCP 2105262335 172.23.16.81 9 typ host tcptype active
a=candidate:7 1 TCP 2105393407 fd20:8ed:735c:1700:c38:d760:eb13:6d80 9 typ host tcptype active
a=candidate:9 1 TCP 2105458943 fd20:8ed:735c:1700:8576:1891:96b1:c1fc 9 typ host tcptype active
a=candidate:11 1 TCP 2105327871 192.168.100.168 9 typ host tcptype active
a=candidate:13 1 TCP 2105524479 172.17.31.49 9 typ host tcptype active
a=candidate:10 1 UDP 8265727 3.0.167.49 58218 typ relay raddr 3.0.167.49 rport 58218
a=candidate:6 1 UDP 8069119 3.0.167.49 55603 typ relay raddr 3.0.167.49 rport 55603
a=candidate:12 1 UDP 8134655 13.231.40.57 61589 typ relay raddr 13.231.40.57 rport 61589
a=candidate:8 1 UDP 8200191 13.231.40.57 62314 typ relay raddr 13.231.40.57 rport 62314
a=candidate:14 1 UDP 8331263 54.214.212.235 50389 typ relay raddr 54.214.212.235 rport 50389
a=end-of-candidates
a=ssrc:3757391444 cname:{3ed7c83f-d024-4409-87e4-2896ef09dc4d}-1
a=ssrc:3757391444 msid:{f393ca66-a228-48ad-9800-6275a23b2efe}-1 {3fd21989-fa26-4fb7-a27d-fe31ec17a2f1}-1
a=rtcp-mux
m=video 50389 RTP/SAVPF 100 107 101
c=IN IP4 54.214.212.235
a=rtpmap:100 VP8/90000
a=rtpmap:107 H264/90000
a=rtpmap:101 VP9/90000
a=fmtp:107 profile-level-id=42e01f;level-asymmetry-allowed=1;packetization-mode=1
a=fmtp:100 max-fs=12288;max-fr=60
a=fmtp:101 max-fs=12288;max-fr=60
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=rtcp-fb:100 ccm fir
a=rtcp-fb:107 nack
a=rtcp-fb:107 nack pli
a=rtcp-fb:107 ccm fir
a=rtcp-fb:101 nack
a=rtcp-fb:101 nack pli
a=rtcp-fb:101 ccm fir
a=extmap:3 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=setup:active
a=mid:video
a=sendrecv
a=ice-ufrag:52ac8f74
a=ice-pwd:de76bcb464d09066e208e353d3f5a45d
a=ssrc:1482246740 cname:{3ed7c83f-d024-4409-87e4-2896ef09dc4d}-1
a=ssrc:1482246740 msid:{15e2f9b3-fc42-4c9c-8161-0b5a41773991}-1 {fb06004a-6362-4f10-b9e3-f09bfe340552}-1
a=rtcp-mu
```

* [2019-07-29, WebRTC：会话描述协议SDP, chyingp](https://www.cnblogs.com/chyingp/p/sdp-in-webrtc.html)

  解读 SDP 字段含义。

* [NAT详解：基本原理、穿越技术(P2P打洞)、端口老化等](http://www.52im.net/article-64-1.html)

  IPv4 地址不够 -> NAT（公网和局域网之间地址转换） -> 影响通信 -> NAT 穿透技术（STUN/TURN）

## 资源

* STUN 服务器：<http://olegh.ftp.sh/public-stun.txt>，<https://gist.github.com/zziuni/3741933>。
* React Native 依赖：[react-native-webrtc](https://github.com/react-native-webrtc/react-native-webrtc)
