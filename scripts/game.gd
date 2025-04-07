class_name GameManager

extends Control

@onready var current_room: Room = $Room/Room1

@onready var room: Node2D = $Room
@onready var overlay: Control = $Overlay
@onready var mask: Mask = $BackBufferCopy/mask

@onready var audio: AudioStreamPlayer = $Audio

signal changed_room

signal created_overlay(name: String)
signal changed_overlay(name: String)

func change_room(sceen: PackedScene) -> Room:
	print('Room Change')
	
	if (current_room != null):
		_unload_room(current_room)
		changed_overlay.emit('')
		
	var node = _load_room(sceen)
	changed_room.emit()
	return node


func _unload_room(old_room: Room):
	assert(old_room != null)
	
	old_room.queue_free()
	current_room = null
	return true


func _load_room(scene: PackedScene) -> Room:
	assert(scene != null)
	
	var node = scene.instantiate()
	
	var new_room = node as Room
	assert(new_room != null)
	
	room.add_child(new_room)
	current_room = new_room
	return new_room

func change_overlay(overlay_id: String):
	print('Overlay Change')
	changed_overlay.emit(overlay_id)

func create_overlay(sceen: PackedScene) -> Overlay:
	print('Overlay Create')
	var node = _load_overlay(sceen)
	created_overlay.emit(node.name)
	return node

func _load_overlay(scene: PackedScene) -> Overlay:
	assert(scene != null)
	
	var node = scene.instantiate()
	
	var new_overlay = node as Overlay
	assert(new_overlay != null)
	
	overlay.add_child(new_overlay)
	return new_overlay


func _ready() -> void:
	Global.restet.connect(_reset_room)
	print('Room Ready')


func _reset_room():
	get_tree().reload_current_scene()
