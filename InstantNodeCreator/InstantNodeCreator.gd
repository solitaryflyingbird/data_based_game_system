extends Node

# The path to the data folder
const DATA_PATH = "res://data"

func _ready():
	var x = get_all_files_and_folders(DATA_PATH)
	_create_nodes_from_folder(DATA_PATH, self)

func _create_nodes_from_folder(folder_path: String, parent_node: Node):
	var dir = Directory.new()
	var stack = [{"path": folder_path, "parent": parent_node}]

	while stack.size() > 0:
		print(stack, "스")
		var current = stack.pop_front()
		var files_and_folders = get_all_files_and_folders(current["path"])

		if files_and_folders.empty():
			print("Error: Could not open folder:", current["path"])
			return

		for file_name in files_and_folders:
			var file_path = current["path"].plus_file(file_name)

			if dir.file_exists(file_path):  # Check if it's a file
				if file_name.ends_with(".json"):
					var new_data_node = _create_data_node(file_path)
					current["parent"].add_child(new_data_node)
			elif dir.dir_exists(file_path):  # Check if it's a folder
				var new_folder_node = Node.new()
				new_folder_node.name = file_name
				current["parent"].add_child(new_folder_node)
				stack.push_front({"path": file_path, "parent": new_folder_node})


func get_all_files_and_folders(dir_path: String) -> Array:
	var dir = Directory.new()
	var result = []

	if dir.open(dir_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			result.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()

	return result

func _create_data_node(file_path: String) -> Node:
	var data_node = Node.new()
	data_node.name = file_path.get_file().get_basename()
	data_node.set_meta("file_path", file_path)
	return data_node
