extends Node
class_name BaseSignalBus

var signal_classes = [TestSignal]	# 保存定义好的信号类BaseSignal
var signal_nodes = {}

# 实例化信号类

func init():
	for s in signal_classes:
		var node = s.new()
		add_child(node)
		var key = str(node.get_script())
		signal_nodes[key] = node
		
func connect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in signal_nodes:
		push_error("尝试连接未定义的信号.")
		return
	
	var target = signal_nodes[key]
	target.connect_signal(function)

func disconnect_signal(signal_class, function: Callable):
	var key = str(signal_class)
	if key not in signal_nodes:
		push_error("尝试断开未定义的信号.")
		return
	
	var target = signal_nodes[key]
	target.disconnect_signal(function)
	
func emit_signal_with_data(signal_class, data: Dictionary):
	var key = str(signal_class)
	if key not in signal_nodes:
		push_error("尝试发送未定义的信号.")
		return
	
	var target = signal_nodes[key]
	target.emit_signal_with_data(data)