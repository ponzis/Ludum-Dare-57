extends Control

@onready var hand_icon: TextureRect = $Bottom/Hand

func _ready() -> void:
	GameState.pickup.connect(_on_item_change)
	
func _on_item_change(item: Item):
	if item == null:
		hand_icon.texture = null
		return
		
	hand_icon.texture = item.texture


func _on_reset_pressed() -> void:
	Global.reset_scene()
