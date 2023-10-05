extends BaseArchitecture

func _init():
	_register_signal_bus("Main", SampleSignalBus)
	
	register_component("Storage", Storage.new())
	register_component("CounterAppModel", CounterAppModel.new())
	register_component("AchievementSystem", AchievementSystem.new())
	
	
