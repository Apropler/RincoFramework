extends RincoHandle
class_name SendCommandHandle

func execute(command: RincoCommand, param={}):
    _architecture.send_command(command, param)
