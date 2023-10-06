extends BaseModel
class_name CounterAppModel

var storage

var count = 0:
	get:
		return count
	set(value):
		if count != value:
			count = value
			storage.save("count", count)

func _init_component():
	storage = get_component_handle.execute("Storage")
	count = storage.load("count", 0)
