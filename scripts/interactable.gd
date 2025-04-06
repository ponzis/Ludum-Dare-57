class_name Interactable
extends Sprite2D

signal interact


@export_group("Properties")
@export var description: String = ""


@export_subgroup("Border")
@export var show_border: bool = false
@export var border_distance: float = 0.0
@export_range(1, 100, 1, "or_greater")
var line_thickness: float = 10.0

func _init() -> void:
	print("Item: ", name, " init")


func _ready():
	print("Item: ", name, " ready")
	call_deferred("ready_cleanup")
	

func ready_cleanup():
	is_pixel_opaque(get_local_mouse_position()) #Move lag to init


func _process(_delta: float) -> void:
	if(show_border):
		material.set_shader_parameter('line_thickness', line_thickness)
	else:
		material.set_shader_parameter('line_thickness', 0.0)

func click():
	print('Click Interactable')
	interact.emit(name)


func is_close(mouse_position: Vector2) -> bool:
	if to_local(position).distance_to(mouse_position) < border_distance:
		return true
	return false

func _input(event: InputEvent) -> void:
	show_border = false
	if not visible:
		return
	
	var mouse_position = get_local_mouse_position()
	if is_close(mouse_position) || is_pixel_opaque(mouse_position):
		if event.is_action_pressed("l_click") && event.is_pressed() and not event.is_echo():
			click()
			return
		show_border = true
		return
