class_name BaseModel

var _architecture: BaseArchitecture

var _get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())
	
var _emit_signal_handle:
	get: return EmitSignalHandle.new(_get_architecture())

func init():
	pass
	
func set_architecture(architecture):
	_architecture = architecture

func _get_architecture():
	if not _architecture:
		push_error("意外错误, 未设置架构.")
	return _architecture
