extends Node
class_name BaseController

var _architecture: BaseArchitecture

var get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())

var send_command_handle:
	get: return SendCommandHandle.new(_get_architecture())

var connect_signal_handle:
	get: return ConnectSignalHandle.new(_get_architecture())

var get_utility_handle:
	get: return GetUtilityHandle.new(_get_architecture())
	
func _get_architecture():
	push_error("未设置架构, 需要重写方法: _get_architecture().")
	return null
