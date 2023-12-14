class_name RincoModel extends RincoComponent


var get_component_handle: GetComponentHandle:
	get: return GetComponentHandle.new(_get_architecture())
	
var emit_signal_handle: EmitSignalHandle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle: GetUtilityHandle:
	get: return GetUtilityHandle.new(_get_architecture())
