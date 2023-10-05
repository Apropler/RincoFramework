class_name IOCContainer

var _instance_dict = {}

# T: 类名, instance: 实例
func register(T, instance):
	_instance_dict[T] = instance
	
func get_instance(T):
	if T not in _instance_dict:
		push_error("尝试从容器中获取未注册的实例.")
		return null
	return _instance_dict[T]
	
