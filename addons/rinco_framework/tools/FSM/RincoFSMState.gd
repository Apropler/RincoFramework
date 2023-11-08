class_name RincoFSMState

var state_name: String

var enter_func: Callable = func(): pass
var exit_func: Callable = func(): pass
var action_func: Callable = func(delta): pass
var change_cond_func: Callable = func(cond: RincoFSMCondition): pass

func _init(key: String):
	state_name = key

func _enter_state():
	enter_func.call()
	
func _action(delta):
	action_func.call(delta)
	
func _exit_state():
	exit_func.call()
	
func _change_condition(cond: RincoFSMCondition):
	change_cond_func.call(cond)
