extends BaseTest
class_name Test
var ioc = IOCContainer.new()

var score = 0: 
	get:
		return 114514
	set(value):
		score = value


func _ready(): print(score)