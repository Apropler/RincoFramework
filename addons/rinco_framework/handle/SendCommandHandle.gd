class_name SendCommandHandle extends RincoHandle


func execute(command: RincoCommand, param={}):
	_architecture.send_command(command, param)
