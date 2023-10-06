extends BaseUtility
class_name Storage

var config = ConfigFile.new()

func save(key: String, value):
	config.set_value("Storage", key, value)
	config.save("user://storage.cfg")

func load(key: String, default_value=0):
	var err = config.load("user://storage.cfg")
	if err != OK:
		push_error("保存失败.")
		return default_value
	var value = config.get_value("Storage", key)
	if not value:
		value = default_value
	return value
	
func save_achievement(achievement) -> bool:
	# 成就未解锁则保存，返回true，已解锁则返回false
	return true
