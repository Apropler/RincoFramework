extends Node
class_name BaseSignalBus

# 信号加载
var signal_classes = [
	load("res://Script/testp.gd"),
	
]
var signal_nodes = {}
func init():
	for s in signal_classes:
		var node = s.new()
		add_child(node)
		signal_nodes[node.signal_name] = node
		
func connect_signal(signal_name, func: Callable):
	target = signal_nodes[signal_name]
	target.triggered.connect(func)
	
func emit_signal(data: Dictionary):
	triggered.emit(data)
