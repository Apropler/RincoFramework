# Controller
操控游戏逻辑  
继承 RincoController 类  
控制器作为节点 Node 被使用
#### 初始化
在使用框架功能前需要先重写函数 _get_architecture() 指定 [Architecture](Architecture.md)  
```
func _get_architecture():
	return null
```
Architecture 一般被设置为单例  
建议使用 Godot 的 AutoLoad 功能自动加载单例（见 [Architecture](Architecture.md)）  
此时指定 architecture 的方法为  
```
func _get_architecture():
	return SampleArchitecture
```
#### 功能
Controller 类中可以连接信号、发送命令、获取组件  
调用方式见 [Handle](Handle.md)