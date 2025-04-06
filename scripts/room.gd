class_name Room

extends Node2D

@export var id: int
@export var color_texture: Texture
@export var depth_texture: Texture


@onready var background: Sprite2D = $Background

func get_background_scale() -> float:
	return background.scale.x
