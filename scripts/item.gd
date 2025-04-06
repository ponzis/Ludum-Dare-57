class_name Item
extends Sprite2D

signal interact

@export_group("Properties")
@export var description: String = ""
@export var holdable: bool = false
@export var show_border: bool = false
@export var delete_on_click: bool = true


@export_range(1, 100, 1, "or_greater")
var line_thickness: float = 10.0

func _ready():
	print("Item: ", name, " ready")
	
func _process(delta: float) -> void:
	if(show_border):
		material.set_shader_parameter('line_thickness', line_thickness)
	else:
		material.set_shader_parameter('line_thickness', 0.0)

func click():
	interact.emit(name)
	GameState.item = self
	if delete_on_click:
		queue_free()
		print('Removed self')


func _input(event: InputEvent) -> void:
	if is_pixel_opaque(get_local_mouse_position()) && visible:
		if event.is_action("l_click"):
			click()
			return
		show_border = true
		return
	show_border = false
