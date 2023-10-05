extends Node
class_name BaseController

var _architecture: BaseArchitecture

var _get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())

var _send_command_handle:
	get: return SendCommandHandle.new(_get_architecture())

var _connect_signal_handle:
	get: return ConnectSignalHandle.new(_get_architecture())

func _set_architecture(architecture):
	_architecture = architecture

func _get_architecture():
	if not _architecture:
		push_error("未设置架构, 需要调用方法: _set_architecture(architecture).")
	return _architecture
