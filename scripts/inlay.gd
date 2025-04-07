class_name Inlay

extends Interactable

@export var inlay: PackedScene

@onready var game: GameManager = $/root/Root

var overlay: Overlay

func _ready() -> void:
	pass


func click():
	print('Click Inlay')
	super.click()
	_toggle_overlay()


func _toggle_overlay():
	if overlay == null:
		assert(inlay != null)
		overlay = game.create_overlay(inlay);
	overlay.open()
