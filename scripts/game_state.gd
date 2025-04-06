extends Node

signal pickup

@export var player_name: String = "Bob"
@export var score: int = 0

@export var item: Item:
	set(value):
		pickup.emit(value)
		item = value
