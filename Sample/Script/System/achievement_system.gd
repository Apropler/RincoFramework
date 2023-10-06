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
	storage = get_utility_handle.execute("Storage")
	
	connect_signal_handle.execute("Main", CountChangeSignal, 
		func(data):
			if model.count == 10:
				achievement_completed(Achievement.INITIATE)
			elif model.count == 20:
				achievement_completed(Achievement.EXPERT)
			elif model.count == -10:
				achievement_completed(Achievement.ROOKIE)
	)
	
	reset_achievement()


func achievement_completed(achievement_name: Achievement):
	if not save_achievement(achievement_name):
		return
	
	match achievement_name:
		Achievement.ROOKIE:
			print("点击菜鸟")
		Achievement.INITIATE:
			print("点击学徒")
		Achievement.EXPERT:
			print("点击专家")

func save_achievement(achievement) -> bool:
	# 成就未解锁则保存，返回true，已解锁则返回false
	var flag = storage.load_data(str(achievement))
	if flag:
		print("成就已解锁.")
		return false
	storage.save_data(str(achievement), 1)
	return true

func reset_achievement():
	for a in Achievement.values():
		storage.save_data(str(a), 0)
		
