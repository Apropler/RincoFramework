extends BaseModel
class_name CounterAppModel

var storage

var count = 0:
	get:
		return count
	set(value):
		if count != value:
			count = value
			storage.save_data("count", count)
			emit_signal_handle.execute("Main", CountChangeSignal)

func _init_component():
	storage = get_utility_handle.execute("Storage")
	count = storage.load_data("count", 0)
