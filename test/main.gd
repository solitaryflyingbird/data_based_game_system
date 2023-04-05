extends Node2D

onready var instant_node_creator = $InstantNodeCreator

func _ready():
	# Wait for the InstantNodeCreator to process the nodes.
	yield(instant_node_creator, "ready")
	print(11)
	# Print the created nodes.
	print_nodes(instant_node_creator)

func print_nodes(node: Node, indent: int = 0):
	var indent_str = "\t".repeat(indent)
	print("%sNode: %s" % [indent_str, node.name])

	# If the node has metadata "file_path", print it.
	if node.has_meta("file_path"):
		print("%sFile Path: %s" % [indent_str, node.get_meta("file_path")])

	# Recursively print the node's children.
	for child in node.get_children():
		print_nodes(child, indent + 1)

