extends BaseCommand
class_name DecreaseCountCommand

func execute(data):
    get_component_handle.execute("CounterAppModel").count -= 1