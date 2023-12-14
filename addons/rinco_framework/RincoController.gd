class_name RincoController extends Node

var _architecture: RincoArchitecture

var get_component_handle: GetComponentHandle:
	get: return GetComponentHandle.new(_get_architecture())

var send_command_handle: SendCommandHandle:
	get: return SendCommandHandle.new(_get_architecture())

var connect_signal_handle: ConnectSignalHandle:
	get: return ConnectSignalHandle.new(_get_architecture())

var get_utility_handle: GetUtilityHandle:
	get: return GetUtilityHandle.new(_get_architecture())
	
func _get_architecture() -> RincoArchitecture:
	push_error("未设置架构, 需要重写方法: _get_architecture().")
	return null
