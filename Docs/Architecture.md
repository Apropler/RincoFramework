# Architecture
### 示例
```GDScript
extends RincoArchitecture

func _init():
	register_signal_bus("Main", SampleSignalBus)
	
	register_utility("SampleUtility", SampleUtility.new())
	
	register_component("SampleModel", SampleModel.new())
	register_component("SampleSystem", SampleSystem.new())
	
```

Architecture 类负责进行模块管理，一般被设置为单例  
建议使用 Godot 的 AutoLoad 功能自动加载单例  

![Alt text](image/AutoLoad.png)  
  
  
可以在 _init() 函数中注册信号总线、组件和工具  
被注册的脚本可以在其他脚本中被获取  

#### 注册信号总线 [Signal](Signal.md)
bus_name: 自定义总线名  
bus_class: 总线类名

```GDScript
func register_signal_bus(bus_name, bus_class)
```

#### 注册组件 [Component](Component.md)
在RF中，model、system被统称为组件component  

key: 组件标识  
component: 组件实例 

```GDScript
func register_component(key, component)
```

以键值对的方式将组件注册到架构中  

#### 注册工具 [Utility](Utility.md)
任何脚本都可以被视作工具类，并通过该方法注册进架构中

key: 工具标识  
component: 工具实例 

```GDScript
func register_utility(key, component)
```
 