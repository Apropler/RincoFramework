# RincoFramework

这是一套使用GDScript语言模仿QFramework编写的游戏开发框架
[QFramework](https://github.com/liangxiegame/QFramework)

大体来说算是简化版的QF，使用方式基本与QF一致。

框架沿用了QF的一些设计，如：
- [Architecture](docs/Architecture.md)
- [Controller](docs/Controller.md)
- [Model](docs/Model.md)
- [Command](docs/Command.md)
- [Utility](docs/Utility.md)

另外，该框架使用了Godot引擎的信号机制代替了QF的Event，以下进行介绍

## Signal
RF提供了BaseSignalBus脚本和BaseSignal脚本对信号进行管理

BaseSignal 脚本将单个信号封装成节点Node，目的是为了给信号封装一些属性，作为固定参数进行发送

BaseSignalBus 信号总线类似信号的分组，在Architecture中可以注册多个信号总线，每个总线又分别可以设置多个信号（我也不知道有没有用，反正先写了再说）

#### 信号注册
信号类需要在 _init() 方法中为数组 must_have_param 赋值，表示该信号必须传递的参数
```
extends BaseSignal
class_name SampleSignal

func _init():
	must_have_param = ["hello_rinco"]
```

信号总线类需要在 _init() 方法中为数组 signal_classes 赋值，表示该总线包含的信号，数组元素为类名
```
extends BaseSignalBus
class_name SampleSignalBus

func _init():
	signal_classes = [SampleSignal1, SampleSignal2]
```
在 Architecture 类中对信号总线进行注册
```
extends BaseArchitecture

func _init():
	_register_signal_bus("Main", SampleSignalBus) # 传入自定义总线名和类名
```
#### 信号使用
在 Model 和 Command 类中可以发送信号，以 Model 类为例
```
extends BaseModel
class_name SampleModel

var score = 0: 
	get:
		return score
	set(value):
		score = value
        # 传入总线名、信号类名和传递的参数
        # 参数必须是字典，字典的键对应信号类中定义的must_have_param
		_emit_signal("Main", SampleSignal, {"hello_rinco": score})

```
在 Controller 类中可以连接信号
```
extends BaseController

func _ready():
	_set_architecture(SampleArchitecture)
	
	_connect_signal("Main", SampleSignal, test) # 传入总线名、信号类名、绑定的函数名

# 传入的data为字典
# 绑定的函数必须且只能含有一个参数接收信息，尽管有时候传递的参数为空字典
func test(data):
	print(data)

```