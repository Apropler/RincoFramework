# Architecture
#### 示例
```
extends BaseArchitecture

func _init():
	_register_signal_bus("Main", SampleSignalBus)
	
	register_component(SampleModel, SampleModel.new())
	register_component(AddUtility, AddUtility1.new())
```

Architecture 类负责进行模块管理

可以在 _init() 函数中注册主线和组件

##### 注册信号主线
bus_name: 自定义主线名  
bus_class: 主线类名

```
func _register_signal_bus(bus_name, bus_class)
```

##### 注册组件

```

func register_component(component_class, component)
```