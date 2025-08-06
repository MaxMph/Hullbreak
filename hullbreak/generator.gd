extends Node2D

var energy_cell = 1
var speed = 1

@export var collision: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func interact():
	pass

func _on_timer_timeout() -> void:
	Global.energy += energy_cell
	$Timer.wait_time = 1.0 / speed
	$Timer.start()
