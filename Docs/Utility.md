# Utility
在RF中，任何一个脚本都可以是Utility  
一般在其中封装一些工具方法供其他脚本进行调用  

#### 示例
存储工具
```python
class_name Storage

var config = ConfigFile.new()

func _init():
	var err = config.load("user://storage.cfg")
	if err != OK:
		print("加载失败.")

func save_data(key: String, value):
	config.set_value("Storage", key, value)
	config.save("user://storage.cfg")

func load_data(key: String, default_value=0):
	var value = config.get_value("Storage", key, default_value)
	return value

```
将该工具注册到架构中
```python
extends BaseArchitecture

func _init():
    ···
	register_utility("Storage", Storage.new())
	···
```
调用工具
```python
var storage = get_utility_handle.execute("Storage")
var count = storage.load_data("count", 0)
count += 1
storage.save_data("count", count)
```

#### 目的
便于维护  
假如此时需要使用另一种存储方式，则可以编写一个新的存储工具类 StorageJson，在其中实现 save_data 方法和 load_data 方法，注册时直接进行替换，实现一个伪接口的效果
```python
extends BaseArchitecture

func _init():
    ···
	register_utility("Storage", StorageJson.new())
	···
```