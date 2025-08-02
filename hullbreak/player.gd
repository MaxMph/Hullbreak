extends Node2D

var target_pos
var speed = 200
var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_pos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		move(Vector2.UP)
	if Input.is_action_just_pressed("ui_down"):
		move(Vector2.DOWN)
	if Input.is_action_just_pressed("ui_left"):
		move(Vector2.LEFT)
	if  Input.is_action_just_pressed("ui_right"):
		move(Vector2.RIGHT)
	
	can_move = true
	if global_position != target_pos:
		global_position = global_position.move_toward(target_pos, speed * delta)
		print(global_position)
		can_move = false
	#if InternalMode.is
	
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#if direction:
		#move(direction)

func move(dir):
	if Global.check_collision(target_pos + dir * Global.tilesize) == true:
		can_move = false
		
	if can_move:
		target_pos += dir * Global.tilesize
