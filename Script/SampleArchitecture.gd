extends BaseArchitecture

func _init():
	_register_signal_bus("Main", BaseSignalBus)
	
	register_component(TestModel, TestModel.new())
	register_component(AddUtility, AddUtility2.new())


