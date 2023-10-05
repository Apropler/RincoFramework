class_name BaseCommand

var _architecture

func execute(data):
	print(data)

func set_architecture(architecture):
	_architecture = architecture

func _send_command(command: BaseCommand, param={}):
	_architecture.send_command(command, param)
	
func _get_component(component_class):
	return _architecture.get_component(component_class)

func _emit_signal(bus_name, signal_class, data: Dictionary):
	_architecture.emit_signal_with_data(bus_name, signal_class, data)
