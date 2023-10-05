extends BaseController

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_architecture(SampleArchitecture)
	
	_connect_signal("Main", TestSignal, test)
	_send_command(TestCommand.new(),{"signal_class": TestSignal})
	var test_model = _get_component(TestModel)
	test_model.score = 10
	test_model.score = 20
	test_model.score = 30
	test_model.score = 40
	var add_utility = _get_component(AddUtility)
	print(add_utility.add(1,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func test(data):
	print(data)
