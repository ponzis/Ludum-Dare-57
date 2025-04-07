class_name Overlay

extends Control


var status: bool = false 
signal status_changed(open: bool)

@onready var game: GameManager = $/root/Root

func _ready() -> void:
	game.changed_overlay.connect(_changed_overlay)


func close():
	if not status:
		return
	print("Close overlay ", name)
	change_status(false)

func open():
	if status:
		return
	print("Open overlay ", name)
	game.change_overlay(name)
	change_status(true)

func change_status(isopen: bool):
	status = isopen
	visible = status
	status_changed.emit(status)


func left_click():
	print("clicked on overlay")
	if(status):
		close()

func _changed_overlay(overlay_id: String):
	print(name, " == ", overlay_id)
	if (name != overlay_id):
		close()


#func _input(event: InputEvent) -> void:
	#if event.is_echo():
		#return
	#if not status:
		#return
	#if event.is_action_pressed("l_click", false):
		#get_viewport().set_input_as_handled()
		#left_click()
		#return

func _gui_input(event: InputEvent) -> void:
	if not status:
		return
		
	if event.is_action_pressed("l_click", false):
		get_viewport().set_input_as_handled()
		left_click()
		return
