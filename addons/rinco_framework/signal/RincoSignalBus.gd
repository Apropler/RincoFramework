class_name RincoSignalBus extends Node


var signal_classes = []	# 保存定义好的信号类RincoSignal
var signals = {}

# 实例化信号类
func init_bus():
	for s in signal_classes:
		var new_singal = s.new()
		var key = str(new_singal.get_script())
		signals[key] = new_singal
		
func connect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in signals:
		push_error("尝试连接未定义的信号.")
		return
	
	var target = signals[key]
	target.connect_signal(function)

func disconnect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in signals:
		push_error("尝试断开未定义的信号.")
		return
	
	var target = signals[key]
	target.disconnect_signal(function)
	
func emit_signal_with_data(signal_class, data: Dictionary):
	var key = str(signal_class)
	if key not in signals:
		push_error("尝试发送未定义的信号.")
		return
	
	var target = signals[key]
	target.emit_signal_with_data(data)
