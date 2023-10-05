extends BaseCommand
class_name IncreaseCountCommand

func execute(data):
    _get_component_handle.execute("CounterAppModel").count += 1
    _emit_signal_handle.execute("Main", CountChangeSignal)