class_name ConnectSignalHandle extends RincoHandle


func execute(bus_name, signal_class, function: Callable):
	_architecture.connect_signal(bus_name, signal_class, function)