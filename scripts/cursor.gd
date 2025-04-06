class_name Mask
extends Node2D


func set_depth(texture: Texture, scale: float):
	material.set_shader_parameter('depth', texture)
	material.set_shader_parameter('depth_scale', scale)

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
