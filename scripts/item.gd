class_name Item
extends Interactable

@export_group("Properties")
@export var holdable: bool = false
@export var delete_on_click: bool = true

func click():
	print('Click Item')
	super.click()
	GameState.item = self
	if delete_on_click:
		queue_free()
		print('Removed self')
