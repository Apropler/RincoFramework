class_name RincoArchitecture extends Node


var _signal_bus_dict = {}

var _components = IOCContainer.new()
var _utilitys = IOCContainer.new()
		
		
## 组件操作
# 注册组件
func register_component(key, component):
	component.set_architecture(self)
	_components.register(key, component)

# 获取组件
func get_component(key):
	return _components.get_instance(key)

# 初始化组件
func _notification(what):
	if what == NOTIFICATION_READY:
		
		var all_component = _components.get_all_instance()
		for c in all_component:
			c._init_component()
			

## 命令操作
func send_command(command: RincoCommand, param={}):
	command.set_architecture(self)
	command.execute(param)


## 信号操作
# 注册总线
func register_signal_bus(bus_name, bus_class):
	var new_bus = bus_class.new()
	new_bus.init_bus()
	add_child(new_bus)
	_signal_bus_dict[bus_name] = new_bus

# 连接信号
func connect_signal(bus_name, signal_class, function: Callable):
	var bus = _get_signal_bus(bus_name)
	bus.connect_signal(signal_class, function)

# 断开信号
func disconnect_signal(bus_name, signal_class, function: Callable):
	var bus = _get_signal_bus(bus_name)
	bus.disconnect_signal(signal_class, function)

# 发送信号
func emit_signal_with_data(bus_name, signal_class, data: Dictionary):
	var bus = _get_signal_bus(bus_name)
	bus.emit_signal_with_data(signal_class, data)

# 获取总线
func _get_signal_bus(bus_name: String):
	return _signal_bus_dict[bus_name]


## 工具操作
func register_utility(key, component):
	_utilitys.register(key, component)

func get_utility(key):
	return _utilitys.get_instance(key)
