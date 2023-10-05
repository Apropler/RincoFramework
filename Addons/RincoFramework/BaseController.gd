extends Node
class_name BaseController

var _architecture

func _set_architecture(architecture):
	_architecture = architecture

func _get_architecture():
	if not _architecture:
		push_error("未设置架构, 需要调用方法: _set_architecture(architecture).")
	return _architecture

func _send_command(command: BaseCommand, param={}):
	var archi = _get_architecture()
	if archi: archi.send_command(command, param)
	
func _get_component(component_class):
	var archi = _get_architecture()
	if archi: 
		return archi.get_component(component_class)
	return null

func _connect_signal(bus_name, signal_class, function: Callable):
	var archi = _get_architecture()
	if archi: archi.connect_signal(bus_name, signal_class, function)
