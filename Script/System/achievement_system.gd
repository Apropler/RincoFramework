extends BaseSystem
class_name AchievementSystem

func init():
	var model = _get_component_handle.execute("CounterAppModel")

	_connect_signal_handle.execute("Main", CountChangeSignal, 
		func(data):
			if model.count == 10:
				print("点击达人")
			elif model.count == 20:
				print("点击专家")
			elif model.count == -10:
				print("点击菜鸟")
	)
