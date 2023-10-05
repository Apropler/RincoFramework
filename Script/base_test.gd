extends Node
class_name BaseTest

# Called when the node enters the scene tree for the first time.
func _ready():
	var b = BaseArchitecture.new()
	print(str(BaseArchitecture) + ":" + str(b.get_script()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var sth = "ori"
var t
func printhehe():
	t.hahahaha()