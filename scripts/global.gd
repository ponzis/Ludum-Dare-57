extends Control

signal pickup

@export var item: Item:
	set(value):
		pickup.emit(value)
		item = value

func _process(delta: float) -> void:
	pass
