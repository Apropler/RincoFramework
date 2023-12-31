# RincoFramework

这是一套使用 GDScript 语言模仿 [QFramework](https://github.com/liangxiegame/QFramework) 编写的游戏开发框架  
编写环境为Godot 4.1.1  

大体来说算是简化版的 QF，使用方式基本与QF一致。

[示例](Docs/Sample.md)  

框架沿用了 QF 的一些设计，如：
- [Architecture](Docs/Architecture.md)
- [Controller](Docs/Controller.md)
- [Command](Docs/Command.md)
- [Model](Docs/Component.md)
- [System](Docs/Component.md)
- [Utility](Docs/Component.md)

另外，该框架使用了 Godot 引擎的信号机制代替实现了 QF 的 Event
- [Signal](Docs/Signal.md)  

<br>

**简易示意图**  

![简易示意图](Docs/image/RincoFramework.png)

**逻辑组织方式**  
Controller之间通过信号进行通信，互相组成一张底层的网路，再向上调用Godot中预设的其他节点实现具体功能
![控制器通信](Docs/image/ControllerCommunication.png)

<br>

[下载](https://github.com/Apropler/RincoFramework/releases/tag/rinco)解压后放在 res 路径下即可使用（可能需要重启才能生效，疑似 Godot 的 Bug）
