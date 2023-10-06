extends BaseSystem
class_name AchievementSystem

enum Achievement{
	ROOKIE,
	INITIATE,
	EXPERT,
}

var model
var storage

func _init_component():
	model = get_component_handle.execute("CounterAppModel")
	storage = get_component_handle.execute("Storage")
	
	connect_signal_handle.execute("Main", CountChangeSignal, 
		func(data):
			if model.count == 10:
				achievement_completed(Achievement.INITIATE)
			elif model.count == 20:
				achievement_completed(Achievement.EXPERT)
			elif model.count == -10:
				achievement_completed(Achievement.ROOKIE)
	)

func achievement_completed(achievement_name: Achievement):
	if not storage.save_achievement(achievement_name):
		return
	
	match achievement_name:
		Achievement.ROOKIE:
			print("点击菜鸟")
		Achievement.INITIATE:
			print("点击学徒")
		Achievement.EXPERT:
			print("点击专家")
