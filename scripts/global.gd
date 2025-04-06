extends Control

signal pickup

signal restet

@export var item: Item:
	set(value):
		pickup.emit(value)
		item = value

func _process(delta: float) -> void:
	pass
