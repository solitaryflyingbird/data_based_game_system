extends Node
class_name data_node

export(String, FILE, "*.json") var json_file_path : String
export var data_name = ""
var json_data : Dictionary

func _init():
	pass

func _ready():
	load_json_data()

func load_json_data():
	var file = File.new()
	var xxx= file.open(json_file_path, File.READ)
	if file.open(json_file_path, File.READ) == OK:
		var json_text = file.get_as_text()
		json_data = parse_json(json_text)
		print(json_data)
	else:
		print("Error opening JSON file: ", json_file_path)

func save_json_data():
	var file = File.new()
	if file.open(json_file_path, File.WRITE) == OK:
		file.store_string(to_json(json_data))
		file.close()
	else:
		print("Error writing JSON file: ", json_file_path)
