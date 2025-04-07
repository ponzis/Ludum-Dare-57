class_name Door

extends Interactable

@export var next_room: PackedScene

func _init() -> void:
	pass
	

func click():
	print('Click Door')
	super.click()
	
	assert(game != null)
	game.change_room(next_room)
	
	
