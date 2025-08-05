extends Node2D

var target_pos
var speed = 200
var can_move = true
var shoot_ready = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_pos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		if shoot_ready:
			shoot(Vector2.UP)
		else:
			move(Vector2.UP)
	if Input.is_action_just_pressed("ui_down"):
		if shoot_ready:
			shoot(Vector2.DOWN)
		else:
			move(Vector2.DOWN)
	if Input.is_action_just_pressed("ui_left"):
		if shoot_ready:
			shoot(Vector2.LEFT)
		else:
			move(Vector2.LEFT)
	if  Input.is_action_just_pressed("ui_right"):
		if shoot_ready:
			shoot(Vector2.RIGHT)
		else:
			move(Vector2.RIGHT)
	
	can_move = true
	if global_position != target_pos:
		global_position = global_position.move_toward(target_pos, speed * delta)
		#print(global_position)
		can_move = false
	#if InternalMode.is
	
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#if direction:
		#move(direction)
	
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if Global.ammo > 0:
			can_move = false
			shoot_ready = true
			#print("shoot")

func move(dir):
	if Global.check_collision(target_pos + dir * Global.tilesize) == true:
		can_move = false
		
	if can_move:
		target_pos += dir * Global.tilesize

func shoot(dir):
	Global.ammo -= 1
	shoot_ready = false
	can_move = true
	var dist = 10
	#var tile = global_position + dir * Global.tilesize
	for i in range(dist):
		var tile = global_position + (dir * Global.tilesize * i)
		if Global.find_tile(tile) != null:
			if Global.find_tile(tile).is_in_group("tile") and Global.find_tile(tile).collision == true:
				print("wall")
				$Line2D/Timer.start()
				return
			if Global.find_tile(tile).is_in_group("enemy"):
				Global.find_tile(tile).hit()
		$Line2D.remove_point($Line2D.points.size() - 1)
		$Line2D.add_point(Vector2.ZERO)
		#$Line2D.add_point(global_position)
		$Line2D.add_point(dir * Global.tilesize * i + (Global.tilesize / 2) * dir)
	$Line2D/Timer.start()


func _on_timer_timeout() -> void:
	$Line2D.remove_point($Line2D.points.size() - 1)
