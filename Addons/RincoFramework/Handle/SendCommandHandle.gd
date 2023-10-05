extends BaseHandle
class_name SendCommandHandle

func execute(command: BaseCommand, param={}):
    _architecture.send_command(command, param)
