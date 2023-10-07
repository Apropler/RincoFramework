class_name RincoSignal

signal triggered

var must_have_param = []
	
func connect_signal(function: Callable):
	triggered.connect(function)

func disconnect_signal(function: Callable):
	triggered.disconnect(function)
	
func emit_signal_with_data(data: Dictionary):
	for param in must_have_param:
		if param not in data:
			push_error("信号参数缺失:" + param)
	
	triggered.emit(data)