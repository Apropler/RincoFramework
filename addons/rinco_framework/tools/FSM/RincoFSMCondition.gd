class_name RincoFSMCondition

signal condition_changed

var cond_name: String
var value:
	get: return value
	set(new_value):
		if value != null and typeof(new_value) != typeof(value):
			push_error(
				"试图将一个数据类型为{tar}的值赋给数据类型为{ori}的FSM转移条件"
				.format({
						"ori": typeof(value),
						"tar": typeof(new_value)
			}))
			return
		value = new_value
		condition_changed.emit(new_value)
	
func _init(key: String, init_value):
	if init_value == null: push_error("FSM转移条件初始值不能为空")
	cond_name = key
	value = init_value
