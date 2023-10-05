# Signal
RincoFramework 提供了 BaseSignalBus 脚本和 BaseSignal 脚本对信号进行管理

**信号** 需要继承 BaseSignal 类，将单个信号封装成节点 Node，目的是为了给信号封装一些属性，作为固定参数进行发送

**信号总线** 需要继承 BaseSignalBus 类，类似信号的分组，在Architecture中可以注册多个信号总线，每个总线又分别可以设置多个信号 ~~我也不知道有没有用，反正先写了再说~~  
可以在总线类中进行扩展对信号进行批量处理

#### 信号创建
信号类需要在 _init() 方法中为数组 must_have_param 赋值，表示该信号必须传递的参数
```
extends BaseSignal
class_name SampleSignal

func _init():
	must_have_param = ["hello_rinco"]
```

信号总线类需要在 _init() 方法中为数组 signal_classes 赋值，表示该总线包含的信号，数组元素为对应信号类名
```
extends BaseSignalBus
class_name SampleSignalBus

func _init():
	signal_classes = [SampleSignal1, SampleSignal2]
```
#### 信号注册 [Architecture](Docs/Architecture.md)
在 Architecture 类中对信号总线进行注册  
信号总线被注册后会被添加为 Architecture 实例的子节点  
而后信号总线进行初始化，实例化包含的信号类，并将其添加为自己的子节点
```
extends BaseArchitecture

func _init():
	_register_signal_bus("Main", SampleSignalBus) # 传入自定义总线名和类名
```
#### 信号使用 

在 [Model](Docs/Component.md) 和 [Command](Docs/Component.md) 类中可以发送信号，以 Model 类为例

bus_name: 总线名  
signal_class: 信号类名  
data: 传递的参数  字典

```python
func _emit_signal(bus_name, signal_class, data: Dictionary)
```
```python
extends BaseModel
class_name SampleModel

var score = 0: 
	get:
		return score
	set(value):
		score = value
		_emit_signal("Main", SampleSignal, {"hello_rinco": score})

```  
当 score 发生变化时，发送 SampleSignal 信号，携带数据 score  

<br>

在 [Controller](Docs/Controller.md) 类中可以连接信号  

bus_name: 总线名  
signal_class: 信号类名  
function: 绑定的函数名
```python
func _connect_signal(bus_name, signal_class, function: Callable)
```
```python
extends BaseController

func _ready():
	_set_architecture(SampleArchitecture)
	
	_connect_signal("Main", SampleSignal, test)

# 传入的data为字典
# 绑定的函数必须且只能含有一个参数接收信息，尽管有时候传递的参数为空字典
func test(data):
	print(data)

```
