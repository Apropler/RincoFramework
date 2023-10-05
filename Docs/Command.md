# Command
命令模式相关 

#### 发送命令
在支持发送命令的脚本中使用以下函数  *([Controller](Docs/Controller.md) 和部分 [Component](Docs/Component.md)， Command 自身也可以发送命令)*  

command: 命令实例  
param: 参数 字典类型
```
_send_command(command: BaseCommand, param={})
```
#### 执行命令
命令类继承 BaseCommand  
需要实现函数 execute  
命令被调用时 execute 函数被执行  

#### 功能
Command 类中可以获取组件 [Component](Docs/Component.md)、发送信号 [Signal](Docs/Signal.md)、以及发送其他命令 
- 获取组件 使用方式与 [Component](Docs/Component.md) 类中一致
```
_get_component(key)
```
- 发送信号 使用方式与 [Component](Docs/Component.md) 类中一致
```
_emit_signal(bus_name, signal_class, data: Dictionary)
```
- 发送命令 见上


<br><br><br>


### 示例
发送信号命令  

#### 定义
该命令接收一个信号类名，并发送该信号，携带数据 {"hello": "rinco"}  
信号相关见 [Signal](Docs/Signal.md)

```python
extends BaseCommand
class_name SampleCommand

func execute(data):
	var signal_class = data.signal_class
	_emit_signal("Main", signal_class, {"hello": "rinco"})
```

#### 调用

```python
_send_command(SampleCommand.new(), {"signal_class": SampleSignal})
```

以上调用流程的效果为，发送 SampleSignal 信号，并携带参数 {"hello": "rinco"}  