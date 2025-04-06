extends Node

var current_room: Node2D 

func _ready() -> void:
	Global.restet.connect(_reset_room)
	current_room =  $Room1

func _reset_room():
	current_room.get_tree().reload_current_scene()
