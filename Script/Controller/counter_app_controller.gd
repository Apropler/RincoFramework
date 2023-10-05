extends BaseController

var model
func _ready():
	_set_architecture(CounterApp)

	model = _get_component_handle.execute("CounterAppModel")

	_connect_signal_handle.execute("Main", CountChangeSignal, update_veiw)

func update_veiw(data):
	print(model.count)

func _input(event):
	if event.is_action_pressed("add"):
		_send_command_handle.execute(IncreaseCountCommand.new())
	elif event.is_action_pressed("sub"):
		_send_command_handle.execute(DecreaseCountCommand.new())