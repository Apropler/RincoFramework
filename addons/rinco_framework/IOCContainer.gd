class_name IOCContainer

var _instance_dict = {}

# key: 键, instance: 实例
func register(key, instance):
	_instance_dict[key] = instance
	
func get_instance(key):
	if key not in _instance_dict:
		push_error("尝试从容器中获取未注册的实例.")
		return null
	return _instance_dict[key]
	
func get_all_instance():
	return _instance_dict.values()