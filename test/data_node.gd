extends Node

export var data_node: PackedScene
var data = null

func _init(_data = null):
	self.data = _data



func get_data():
	return self.data
