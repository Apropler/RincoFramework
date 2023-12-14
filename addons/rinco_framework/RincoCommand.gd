class_name RincoCommand

var _architecture: RincoArchitecture

var get_component_handle: GetComponentHandle:
	get: return GetComponentHandle.new(_get_architecture())

var send_command_handle: SendCommandHandle:
	get: return SendCommandHandle.new(_get_architecture())

var emit_signal_handle: EmitSignalHandle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle: GetUtilityHandle:
	get: return GetUtilityHandle.new(_get_architecture())

func execute(data):
	print(data)

func set_architecture(architecture: RincoArchitecture):
	_architecture = architecture

func _get_architecture() -> RincoArchitecture:
	if not _architecture:
		push_error("意外错误, 未设置架构.")
	return _architecture
