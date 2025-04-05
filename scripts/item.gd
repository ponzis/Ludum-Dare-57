extends Node2D

signal interact

@export_group("Properties")
@export var description: String = ""
@export var holdable: bool = false

func _ready():
	print("Item: ", name, " ready")
