extends Node

# Export the NodePath variabl

# Declare a variable to store the instance of the imported node

export var data_node: PackedScene


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

func add_child_node(parent, child_data):
	var child_node = data_node.instance()
	self.add_child(child_node)
	return child_node

