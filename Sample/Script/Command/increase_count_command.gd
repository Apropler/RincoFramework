extends RincoCommand
class_name IncreaseCountCommand

func execute(data):
    get_component_handle.execute("CounterAppModel").count += 1