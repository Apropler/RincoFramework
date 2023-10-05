extends BaseArchitecture

func _init():
	_register_signal_bus("Main", SampleSignalBus)
	
	register_component(SampleModel, SampleModel.new())
	register_component(AddUtility, AddUtility2.new())


