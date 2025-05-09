extends Overlay

signal code_failed;
signal code_pass;

@export var code: String = "0000"
@export var max_enter: int = 4


@onready var label: Label = $Label

var entered_code: String


func _on__pressed(value: int) -> void:
	entered_code += str(value)
	label.text = entered_code
	
	if entered_code.length() > max_enter:
		print('code failed')
		entered_code = ''
		label.text = ''
		code_failed.emit()
		return
	

	if entered_code == code:
		print("Passed code")
		code_pass.emit()
	
	
