class_name Door

extends Interactable

@export var next_room: PackedScene

@onready var game: GameManager = $/root/Root


func click():
	print('Click Door')
	super.click()
	
	assert(game != null)
	game.change_room(next_room)
	
	
