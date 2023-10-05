class_name BaseModel

var _architecture: BaseArchitecture

func set_architecture(architecture):
	_architecture = architecture

func _get_component(component_class):
	return _architecture.get_component(component_class)

func _emit_signal(bus_name, signal_class, data: Dictionary):
	_architecture.emit_signal_with_data(bus_name, signal_class, data)
