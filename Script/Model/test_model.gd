extends BaseModel
class_name TestModel

var score = 0: 
	get:
		return score
	set(value):
		score = value
		_emit_signal("Main", TestSignal, {"hi": score, "type": 0})
