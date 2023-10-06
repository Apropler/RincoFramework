extends BaseArchitecture

func _init():
	register_signal_bus("Main", MainSignalBus)
	
	register_component("Storage", Storage.new())
	register_component("CounterAppModel", CounterAppModel.new())
	register_component("AchievementSystem", AchievementSystem.new())
	
	
