class_name RincoFSM

var _states = IOCContainer.new()
var _conds = IOCContainer.new()

var _initial_state: RincoFSMState:
	get:
		if not _initial_state:
			push_error("FSM未定义初状态.")
		return _initial_state
	set(value): _initial_state = value

var current_state: RincoFSMState:
	get:
		if not current_state:
			current_state = _initial_state
			current_state._enter_state()
		return current_state
	set(value): current_state = value

var _is_locked := false
var _cache_cond := {}

func add_state(state: RincoFSMState, is_initial_state = false):
	_states.register(state.state_name, state)
	if is_initial_state:
		_initial_state = state

func add_condition(cond: RincoFSMCondition):
	_conds.register(cond.cond_name, cond)
	
func change_cond(cond_name: String, value):
	if _is_locked:
		_cache_cond[cond_name] = value
		return
	var cond = _conds.get_instance(cond_name)
	if cond.value != value:
		cond.value = value
		current_state._change_condition(cond)
	
func change_state(state_name: String):
	if current_state:
		current_state._exit_state()
	current_state = _states.get_instance(state_name)
	current_state._enter_state()

func state_action(delta):
	current_state._action(delta)


func lock():
	_is_locked = true
	
func unlock():
	_is_locked = false
	for cond_name in _cache_cond:
		change_cond(cond_name, _cache_cond[cond_name])
