extends BaseHandle
class_name EmitSignalHandle

func execute(bus_name, signal_class, data: Dictionary = {}):
	_architecture.emit_signal_with_data(bus_name, signal_class, data)
