extends BaseComponent
class_name BaseModel

var get_component_handle:
	get: return GetComponentHandle.new(_get_architecture())
	
var emit_signal_handle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle:
	get: return GetUtilityHandle.new(_get_architecture())