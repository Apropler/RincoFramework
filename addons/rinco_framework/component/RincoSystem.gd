class_name RincoSystem extends RincoComponent


var get_component_handle: GetComponentHandle:
	get: return GetComponentHandle.new(_get_architecture())

var connect_signal_handle: ConnectSignalHandle:
	get: return ConnectSignalHandle.new(_get_architecture())
	
var emit_signal_handle: EmitSignalHandle:
	get: return EmitSignalHandle.new(_get_architecture())
	
var get_utility_handle: GetUtilityHandle:
	get: return GetUtilityHandle.new(_get_architecture())
