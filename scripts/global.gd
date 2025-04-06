extends Node

signal restet

signal start
signal end

var game_scene = "res://scenes/game.tscn"
var menu_scene = "res://scenes/menu.tscn"

func start_game():
	print("game start")
	get_tree().change_scene_to_file(game_scene)
	start.emit()

func end_game():
	print("game end")
	get_tree().change_scene_to_file(menu_scene)
	end.emit()

func _process(delta: float) -> void:
	pass
