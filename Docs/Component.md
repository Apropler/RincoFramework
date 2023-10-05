# Component
*在 RincoFramework 中，Model、System、Utility 都被视为 Component* 

#### Component
Component 可以获取其他组件 Component、发送命令 [Command](Docs/Command.md)、连接和发送信号 [Signal](Docs/Signal.md)  
见  [Function](Docs/Function.md)  

对这些功能进行限制后得到 Model、System、Utility
- Model 组件可以获取其他组件和发送信号，一般在其中定义数据，并在数据更改时发送信号
- System 组件可以获取其他组件、连接和发送信号，一般在其中实现一些独立的模块功能
- Utility 组件没有任何功能，一般在其中封装一些工具方法供其他脚本进行调用 



#### 自定义 Component
参考 BaseModel、BaseSystem、BaseUtility 的代码，对 BaseComponent 脚本进行删减即可得到自定义 Component 基类  
实际上任何一个脚本都可以当作 Component 被注册进 Architecture 中，并通过同样的方式进行获取  
~~比如 BaseUtility 类就是一个空脚本~~