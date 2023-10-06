class_name Storage

var config = ConfigFile.new()

func _init():
	var err = config.load("user://storage.cfg")
	if err != OK:
		print("加载失败.")

func save_data(key: String, value):
	config.set_value("Storage", key, value)
	config.save("user://storage.cfg")

func load_data(key: String, default_value=0):
	var value = config.get_value("Storage", key, default_value)
	return value
