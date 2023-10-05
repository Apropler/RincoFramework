extends BaseHandle
class_name ConnectSignalHandle

func execute(bus_name, signal_class, function: Callable):
	_architecture.connect_signal(bus_name, signal_class, function)