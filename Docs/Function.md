## 获取组件
key: 组件标识 对应 Architecture 类中注册的标识
```
func _get_component(key)
```

## 发送命令

command: 命令实例  
param：传入参数
```
func _send_command(command: BaseCommand, param={})
```

## 连接信号

bus_name: 总线名  
signal_class: 信号类名  
function: 连接的函数名
```
func _connect_signal(bus_name, signal_class, function: Callable)
```

## 发送信号

bus_name: 总线名  
signal_class: 信号类名  
data: 信号携带的参数
```		
func _emit_signal(bus_name, signal_class, data: Dictionary)
```
