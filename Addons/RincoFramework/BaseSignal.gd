extends Node
class_name BaseSignal

signal triggered

var signal_name = ""
var must_have_param = []
	
func connect_signal(function: Callable):
	triggered.connect(function)

func disconnect_signal(function: Callable):
	triggered.disconnect(function)
	
func emit_signal(data: Dictionary):
	for param in must_have_param:
		if param not in data:
			push_error("信号参数缺失:" + param)
	
	triggered.emit(data)