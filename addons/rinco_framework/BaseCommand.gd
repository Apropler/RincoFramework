class_name BaseCommand

var _architecture

var get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())

var send_command_handle:
	get: return SendCommandHandle.new(_get_architecture())

var emit_signal_handle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle:
	get: return GetUtilityHandle.new(_get_architecture())

func execute(data):
	print(data)

func set_architecture(architecture):
	_architecture = architecture

func _get_architecture():
	if not _architecture:
		push_error("意外错误, 未设置架构.")
	return _architecture
