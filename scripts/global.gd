extends Control

@onready var mask = $Control/BackBufferCopy/mask

func _process(delta: float) -> void:
	mask.global_position = get_global_mouse_position()
