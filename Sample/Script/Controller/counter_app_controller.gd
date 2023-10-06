extends BaseController

@export var add_button: Button
@export var sub_button: Button
@export var count_text: Label

var model = get_component_handle.execute("CounterAppModel")

func _ready():
	
	connect_signal_handle.execute("Main", CountChangeSignal, update_view)
	
	add_button.pressed.connect(
		func(): send_command_handle.execute(IncreaseCountCommand.new())
	)
	sub_button.pressed.connect(
		func(): send_command_handle.execute(DecreaseCountCommand.new())
	)
	
	update_view()

func update_view(data={}):
	count_text.text = str(model.count)

func _get_architecture():
	return CounterApp
