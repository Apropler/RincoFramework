class_name RincoComponent

var _architecture: RincoArchitecture

func _init_component():
	pass
	
func set_architecture(architecture: RincoArchitecture):
	_architecture = architecture

func _get_architecture() -> RincoArchitecture:
	if not _architecture:
		push_error("意外错误, 未设置架构.")
	return _architecture
