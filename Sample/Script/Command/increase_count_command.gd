extends BaseCommand
class_name IncreaseCountCommand

func execute(data):
    get_component_handle.execute("CounterAppModel").count += 1
    emit_signal_handle.execute("Main", CountChangeSignal)