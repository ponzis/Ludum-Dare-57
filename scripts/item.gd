extends Node2D

@export_group("Properties")
@export var description: String = ""


func _ready():
	print("Item: ", name, " ready")
