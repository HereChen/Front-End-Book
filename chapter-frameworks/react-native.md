# React Native

* 主页: <https://facebook.github.io/react-native>
* GitHub: <https://github.com/facebook/react-native>

开发可单独打包 debug apk，然后执行 `react-native start`，`adb reverse tcp:8081 tcp:8081` 实现端口映射；AndroidX 迁移用 [jetifier](https://github.com/mikehardy/jetifier) 解决。0.60 以后安装 Native 依赖无需更改 Native 工程。

## quickstart

Android 工程及调试、打包流程。

```bash
# requirments: nodejs, @react-native-community/cli，Java，Android SDK

# 1. 工程及依赖
# 新建工程
react-native init MyApp

# 安装 jetifier （如果安装了涉及 Native 的依赖就需要）
npm install --save-dev jetifier

# 安装 Native 依赖后执行
npx jetify

# 2. 开发调试
# Android Debug 打包
cd android && ./gradlew assembleDebug

# 安装 debug apk
adb install app-debug.apk

# 端口映射
adb reverse tcp:8081 tcp:8081

# 启动 js bundle
react-native start

# 查看日志进行调试
adb logcat

# 3. 打包（打包前配置签名）
cd android && ./gradlew assembleRelease
```

## 环境配置

1. 安装 [nodejs](https://nodejs.org).
2. `npm install -g @react-native-community/cli`.

按系统环境选择安装。

### Android (Windows)

1. JDK (并配置环境变量)
2. 安装 Android Studio <http://www.android-studio.org>
3. 通过 SDK Manager 下载 SDK, 并配置环境变量.

```bat
REM set var
set ANDROID_HOME=C:\Users\chenl\AppData\Local\Android\Sdk

REM set Android home path
setx /m ANDROID_HOME "%ANDROID_HOME%"

REM set path
setx /m path "%path%;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools;"
```

### Android (Ubuntu)

```bash
# step 1: openjdk
# 1. https://jdk.java.net/archive/
# 2. http://openjdk.java.net/install/index.html
# 3. https://stackoverflow.com/questions/49507160/how-to-install-jdk-10-under-ubuntu
wget https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz
tar xzvf openjdk-10.0.2_linux-x64_bin.tar.gz
sudo mv jdk-10.0.2 /usr/lib/jvm/java-10-openjdk-amd64/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-10-openjdk-amd64/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-10-openjdk-amd64/bin/javac 1
sudo update-alternatives --config java

# step 2: Android SDK 安装
sudo apt install android-sdk

# step 3: Android SDK 环境配置
vim ~/.bashrc
# export ANDROID_HOME=/usr/lib/android-sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### Android (macOS)

```bash
# step 1: java
brew cask install java

# step 2: 安装 Android Studio, 并下载 SDK, 创建虚拟机

# step 3: 配置 sdk 环境变量
vim ~/.bashrc
# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools\bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### iOS (macOS)

1. App Store 安装 XCode.
2. 其他工具安装

    ```bash
    brew install node
    brew install watchman
    ```

## 打包

### Android 签名打包

1. 签名生成

    ```bash
    cd android/app/
    keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
    ```

2. **签名变量配置** `./android/gradle.properties` 或 `~/.gradle/gradle.properties` 新增内容。

    ```text
    MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
    MYAPP_RELEASE_KEY_ALIAS=my-key-alias
    MYAPP_RELEASE_STORE_PASSWORD=chenlei
    MYAPP_RELEASE_KEY_PASSWORD=chenlei
    ```

3. **gradle 签名配置** `android/app/build.gradle` 新增内容.

    ```groovy
    ...
    android {
        defaultConfig {
          ...
        }

        signingConfigs {
            release {
                storeFile file(MYAPP_RELEASE_STORE_FILE)
                storePassword MYAPP_RELEASE_STORE_PASSWORD
                keyAlias MYAPP_RELEASE_KEY_ALIAS
                keyPassword MYAPP_RELEASE_KEY_PASSWORD
            }
        }

        buildTypes {
            ...
            release {
                signingConfig signingConfigs.release
                ...
            }
        }
        ...
    }
    ```

4. **打包** 打包后在 `android/app/build/outputs/apk/app-release.apk`.

    ```bash
    cd android && ./gradlew clean assembleRelease
    ```

### iOS 打包

iOS 版本编译需要在 Mac 上进行.

#### 签名

没有证书....

#### 生成 ipa

以下流程以 Xcode 9 为例.

1. 打开工程: Xcode 打开 `ios` 文件夹下 `*.xcodeproj` 文件(工程).
2. 选择编译机型: Xcode 虚拟机选择栏中选择 `Generic iOS Device`.
3. 编译设置: Xcode -> Product -> Scheme -> Edit Scheme -> Run -> Info -> Build Configuration 选择 Rlease
4. JS 改为离线(打包进APP)???

## 常用依赖

* 导航：[react-navigation](https://github.com/react-navigation/react-navigation) 提供了常用的导航方式(Stack, Tab, Drawer)。
* UI：[ant-design-mobile](https://github.com/ant-design/ant-design-mobile)。
* UI：[react-native-elements](https://github.com/react-native-training/react-native-elements)
* UI：[NativeBase](https://github.com/GeekyAnts/NativeBase)
* 异步请求：[fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) 为内建接口。
* 异步请求：[axios](https://github.com/axios/axios)。
* <https://github.com/react-native-community> 有一些常用依赖。另外，[Webview](https://github.com/react-native-community/react-native-webview)、[AsyncStorage](https://github.com/react-native-community/async-storage)、[Geolocation](https://github.com/react-native-community/react-native-geolocation) 已经从 React Native 中分离出来。

## 调试

> <https://facebook.github.io/react-native/docs/debugging.html>

根据提示, 可以在菜单按钮选择 Live Reload（有变更时重新加载）。Android 可摇晃手机显示菜单。

### 模拟器

1. [Genymotion](https://www.genymotion.com/download/), 需要先注册, 然后选择 for personal 使用. 如果系统开启了 Hyper-V, 需要先关闭。
2. Android Studio 内建虚拟机, 同样需要关闭 Hyper-V。
3. [Visual Studio Emulator for Android](https://www.visualstudio.com/vs/msft-android-emulator/) 需要开启 Hyper-V。

### 调试工具: Chrome

在不涉及 Native 依赖时可采用此方法。

1. `Remote JS Debugging` 开启JS调试.
2. 浏览器端进去 `http://localhost:8081/debugger-ui/`, 并开启开发工具.
3. 可在 Sources 中设置断点或者代码中写入 `debugger`.

### 调试工具: VSCode

1. 安装扩展: React Native Tools.
2. F5 生成 launch.json 文件.
3. 进入调试菜单(Ctrl + Shift + D), 选择 Debug Android.
4. 设置断点或者写入 `debugger` 开始调试, 在 output 栏输出.

### 调试工具：日志查看

* `adb logcat` 查看日志。
* Android Studio 的 Logcat Tab 查看日志。
* 独立的日志查看工具 [pikey8706/LogCatch](https://github.com/pikey8706/LogCatch)，方便筛选日志又不占太多内存。

### 调试工具：请求查看

* Fiddler：和在手机上调试 Web 应用一样，配置 Fiddler 代理，查看请求响应。
* 如果用 Chrome 调试，可进行配置，在 Chrome 的 Network Tab 中查看。

  ```javascript
  // https://github.com/facebook/react-native/issues/934
  GLOBAL.XMLHttpRequest = GLOBAL.originalXMLHttpRequest || GLOBAL.XMLHttpRequest;
  ```

## 工程结构

> 1. [Organizing a React Native Project](https://medium.com/the-react-native-log/organizing-a-react-native-project-9514dfadaa0)
> 2. [React native project setup — a better folder structure](https://hackernoon.com/manage-react-native-project-folder-structure-and-simplify-the-code-c98da77ef792)

```bash
├── android/         # Android 工程
├── ios/             # iOS 工程
├── src/             # 开发前端资源
│   ├── assets/      # 静态资源
│   ├── components/  # 组件
│   ├── api/         # 接口
│   ├── route/       # 导航(路由)
│   ├── config/      # 常量配置
│   ├── pages/       # 页面/功能
│   ├── utils/       # 常用工具
│   ├── reducers 相关
│   └── index.js     # APP 入口
└── index.js         # 入口文件
```

## 环境切换

采用 [react-native-config](https://github.com/luggit/react-native-config) 可分环境打包参数。

1. 依赖安装

    ```bash
    npm install react-native-config
    ```

2. 新建环境变量文件 `.env.dev`

    ```bash
    API_URL=https://myapi.com
    GOOGLE_MAPS_API_KEY=abcdefgh
    ```

3. 变量使用

    ```javascript
    import Config from "react-native-config";

    Config.API_URL; // 'https://myapi.com'
    Config.GOOGLE_MAPS_API_KEY; // 'abcdefgh'
    ```

4. 打包时配置变量定义文件

    ```bash
    SET ENVFILE=.env.dev && gradlew.bat clean assembleRelease       # cmd
    env:ENVFILE=".env.dev"; ./gradlew clean assembleRelease         # powershell
    ENVFILE=.env.dev ./gradlew clean assembleRelease                # bash
    ```

## 全局异常捕获

异常如果不处理，APP 会崩溃。

```javascript
// 全局异常捕获
global.ErrorUtils.setGlobalHandler(e => {
    // 异常处理
    // Modal.alert("异常", `Error: ${e.message}, stack:\n ${e.stack}`);
});
```

## Tips

* Android 虚拟机: <kbd>Ctrl</kbd> + <kbd>M</kbd> 打开菜单 (Android Studio自带虚拟机没有菜单和摇晃手机, 可以这种方式打开菜单)。
* iPhone 虚拟机重新加载资源: <kbd>command</kbd> + <kbd>R</kbd>。
* Android 安装新的应用前需要卸载之前的。
* Android Studio 模拟器如果启动有问题，可尝试 Wipe Data 后再启动。
* Android 多个设备，命令需要加上设备标识，比如 `adb -s de9de04 reverse tcp:8081 tcp:8081`。
* Android Sutdio 打开 Android 工程，会自动生成 `android/local.properties`，如果是多个环境开发（WSL 和 Windows），会导致 WSL 中配置信息（SDK 路径）不对。
* 常用命令

    ```bash
    # 本地调试启动
    react-native run-android
    react-native run-ios

    # 打印调试 log
    react-native log-android
    react-native log-ios

    # 启动本地服务, 使得 bundle 可访问
    react-native start

    # ## Android
    # 打开 RN 菜单 (不用摇手机)
    adb shell input keyevent KEYCODE_MENU

    # 查看当前连接的 Android 设备
    adb devices

    # 查看日志
    adb logcat

    # 安装应用
    adb install app-release.apk

    # 重启 adb
    adb kill-server
    adb start-server
    ```

## 阅读

* [ReactNative源码篇：渲染原理](https://github.com/guoxiaoxing/react-native/blob/master/doc/ReactNative源码篇/4ReactNative源码篇：渲染原理.md)
* [基于 React Native 的跨三端应用架构实践, 陈子涵, 2018-12-29](https://www.infoq.cn/article/vXkNh*HVrW7HUeiNdlsk)
