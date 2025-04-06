extends Control

@export var room_index: int = 0
@export var rooms_packs: Array[PackedScene]


@onready var current_room: Room
@onready var room: Node2D = $Room
@onready var mask: Mask = $BackBufferCopy/mask


func _ready() -> void:
	Global.restet.connect(_reset_room)
	print('Room Ready')

	if (current_room != null && current_room.id == room_index):
		return
	print(rooms_packs[room_index].resource_name)
	
	var scene = rooms_packs[room_index].instantiate()
	if(current_room != null):
		current_room.queue_free()
	room.add_child(scene)
	
	current_room = scene as Room
	
	var scale = current_room.get_background_scale()
	mask.set_depth(current_room.depth_texture, scale)


func _reset_room():
	current_room.get_tree().reload_current_scene()
