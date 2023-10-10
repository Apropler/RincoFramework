# Component
*在 RincoFramework 中，Model、System 都被视为 Component* 

#### Component
Component 可以获取其他组件 Component，获取工具 [Utility](Utility.md)、发送命令 [Command](Command.md)、连接和发送信号 [Signal](Signal.md)  
调用方式见 [Handle](Handle.md)  

对这些功能进行限制后得到 Model和System
- Model 组件可以获取其他组件、获取工具和发送信号，一般在其中定义数据，并在数据更改时发送信号
- System 组件可以获取其他组件、获取工具、连接和发送信号，一般在其中实现一些独立的模块功能



#### 修改 Component
给 Component 添加功能只需要在子类中定义对应 handle 变量
```GDScript
var get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())

var send_command_handle:
	get: return SendCommandHandle.new(_get_architecture())

var connect_signal_handle:
	get: return ConnectSignalHandle.new(_get_architecture())
	
var emit_signal_handle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle:
	get: return GetUtilityHandle.new(_get_architecture())
```
例如，创建一个可以发送命令的 Model（非必要情况不建议这样做）  
```GDScript
class_name SendCommandModel extends RincoModel

var send_command_handle:
	get: return SendCommandHandle.new(_get_architecture())
```
这样就可以像其他组件一样调用 send_command_handle 来发送命令了  
