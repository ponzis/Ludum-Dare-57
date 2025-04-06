class_name Inlay

extends Interactable

@export var inlay: PackedScene

@onready var game: GameManager = $/root/Root


func _ready() -> void:
	game.changed_overlay.connect(_changed_overlay)

var overlay: Control

func click():
	print('Click Inlay')
	super.click()
	_toggle_overlay()

func _changed_overlay(name: String):
	if (overlay.name != name):
		overlay.visible = false
		return
	overlay.visible = true

func _toggle_overlay():
	if overlay == null:
		assert(inlay != null)
		overlay = game.create_overlay(inlay);
	assert(overlay != null)
	game.change_overlay(overlay.name)
	
