class_name GetComponentHandle extends RincoHandle


func execute(key: String) -> RincoComponent:
	return _architecture.get_component(key)
