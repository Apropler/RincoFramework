extends BaseModel
class_name SampleModel

var score = 0: 
	get:
		return score
	set(value):
		score = value
		_emit_signal("Main", SampleSignal, {"hi": score, "type": 0})
