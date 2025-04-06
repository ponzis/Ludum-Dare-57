extends Node

signal pickup

@export var score: int = 0

@export var item: Item:
	set(value):
		pickup.emit(value)
		item = value
