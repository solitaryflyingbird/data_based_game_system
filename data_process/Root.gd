extends Node
export var folder_node_class: PackedScene
export var data_node_class: PackedScene
var child_node_list = []

func _ready():
	var child1 = add_child_node(self, "Child 1")
	var child2 = add_child_node(self, "Child 2")
	var child3 = add_child_node(self, "Child 3")

	# Add the second level of children
	add_child_node(child1, "Child 1.1")
	add_child_node(child1, "Child 1.2")
	add_child_node(child1, "Child 1.3")

	add_child_node(child2, "Child 2.1")
	add_child_node(child2, "Child 2.2")

	add_child_node(child3, "Child 3.1")
	add_data_node(child3,"res://data/monster/dragon.json","dragon")

func add_child_node(parent, child_name):
	var child_node = folder_node_class.instance()
	child_node.node_name = child_name
	self.add_child(child_node)
	parent.child_node_list.append(child_node)
	return child_node
func add_data_node(parent, data_node_adress, data_name):
	var child_data = data_node_class.instance()
	child_data.data_name = data_name
	child_data.json_file_path = data_node_adress
	self.add_child(child_data)
	parent.data_list.append(child_data)
