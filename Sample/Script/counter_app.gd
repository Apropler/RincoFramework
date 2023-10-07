extends RincoArchitecture

func _init():
	register_signal_bus("Main", MainSignalBus)
	
	register_utility("Storage", Storage.new())
	
	register_component("AchievementSystem", AchievementSystem.new())
	register_component("CounterAppModel", CounterAppModel.new())
	
	
	
