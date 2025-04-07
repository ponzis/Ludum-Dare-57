class_name RandomTrigger

extends Node

signal triggered

@export var min_time: int = 1
@export var max_time: int = 5

var random = RandomNumberGenerator.new()
var timer = Timer.new()

@onready var status: StatusIndicator = $StatusIndicator

func _ready():
	random.randomize()
	timer.timeout.connect(_on_timer_timeout)

	add_child(timer)
	timer.set_wait_time(random.randf_range(min_time, 300))
	timer.start()
	

func _on_timer_timeout():
	print("trigger")
	triggered.emit()
	timer.set_wait_time(random.randf_range(min_time, max_time))
