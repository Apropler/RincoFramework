## 获取组件
key: 组件标识 对应 Architecture 类中注册的标识
```
get_component_handle.execute(key)
```

## 发送命令

command: 命令实例  
param：传入参数
```
send_command_handle.execute(command: RincoCommand, param={})
```

## 连接信号

bus_name: 总线名  
signal_class: 信号类名  
function: 连接的函数名
```
connect_signal_handle.execute(bus_name, signal_class, function: Callable)
```

## 发送信号

bus_name: 总线名  
signal_class: 信号类名  
data: 信号携带的参数
```		
emit_signal_handle.execute(bus_name, signal_class, data: Dictionary)
```
