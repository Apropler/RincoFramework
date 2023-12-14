class_name EmitSignalHandle extends RincoHandle


func execute(bus_name: String, signal_class, data: Dictionary = {}):
	_architecture.emit_signal_with_data(bus_name, signal_class, data)
