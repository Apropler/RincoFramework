extends Node
class_name BaseArchitecture

var _signal_bus_dict = {}

var _container = IOCContainer.new()

## 容器操作
func register_component(component_class, component):
	if component.has_method("set_architecture"):
		component.set_architecture(self)
	_container.register(component_class, component)

func get_component(component_class):
	return _container.get_instance(component_class)


## 命令操作
func send_command(command: BaseCommand, param={}):
	command.set_architecture(self)
	command.execute(param)


## 信号操作
# 注册总线
func _register_signal_bus(bus_name, bus_class):
	var new_bus = bus_class.new()
	new_bus.init_bus()
	add_child(new_bus)
	_signal_bus_dict[bus_name] = new_bus

# 获取总线
func _get_signal_bus(bus_name: String):
	return _signal_bus_dict[bus_name]

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


