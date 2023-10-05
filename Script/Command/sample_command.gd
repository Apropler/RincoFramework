extends BaseCommand
class_name SampleCommand

func execute(data):
	var signal_class = data.signal_class
	_emit_signal("Main", signal_class, {"hi": "hinmb"})
