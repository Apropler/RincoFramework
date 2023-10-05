class_name BaseSystem

var _architecture: BaseArchitecture

func set_architecture(architecture):
	_architecture = architecture

func _get_component(key):
	return _architecture.get_component(key)

func _connect_signal(bus_name, signal_class, function: Callable):
	var archi = _get_architecture()
	if archi: archi.connect_signal(bus_name, signal_class, function)

func _emit_signal(bus_name, signal_class, data: Dictionary):
	_architecture.emit_signal_with_data(bus_name, signal_class, data)
