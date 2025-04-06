extends Control

@onready var hand_label: Label = $Bottom/Hand

func _ready() -> void:
	GameState.pickup.connect(_on_item_change)
	
func _on_item_change(item):
	if item != null:
		print("Holding %s." % item.name)
		hand_label.text = "Holding %s." % item.name
		return
	hand_label.text = "Holding nothing."


func _on_reset_pressed() -> void:
	Global.restet.emit()
