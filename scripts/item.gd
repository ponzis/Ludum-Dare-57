class_name Item
extends Interactable

@export_group("Properties")
@export var holdable: bool = false
@export var hide_on_click: bool = true


func click():
	print('Click Item')
	super.click()
	
	if holdable:
		GameState.item = self
		
	if hide_on_click:
		visible = false


func _remove():
	queue_free()
	print('Removed self')
