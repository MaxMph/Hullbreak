extends Node2D

@export var width = 80
@export var height = 40
@export var wall: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for w in range(width):
		for h in range(height):
			var new_wall = wall.instantiate()
			new_wall. global_position = Vector2(w - width/2, h - height/2) * Global.tilesize
			add_child(new_wall)
	
	start_room(11, 7, Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_room(roomw, roomh, cords):
	var doors = 0
	var sides = 0
	
	for w in range(roomw):
		for h in range(roomh):
			var curtile = Global.find_tile(Vector2(align(w, roomw), align(h, roomh)))
			get_tree().queue_delete(curtile)
	
	#add door
	var chosen_side = randi_range(1, 4)
	match chosen_side:
		1:
			#var curtile = Global.find_tile(Vector2(align(roundi(roomw / 2), roomw), align(roundi(roomh / 2), roomh)))
			#get_tree().queue_delete(curtile)
			var curtile = Global.find_tile(Vector2(align(roundi(roomw / 2), roomw), align(-1, roomh)))
			#print(Vector2(align(roundi(roomw / 2), roomw), align(-1, roomh)))
			#print(curtile)
			get_tree().queue_delete(curtile)
			print(chosen_side)
		2:
			var curtile = Global.find_tile(Vector2(align(roundi(roomw / 2), roomw), align(roomh + 1, roomh)))
			#print(Vector2(align(roundi(roomw / 2), roomw), align(roomh + 1, roomh)))
			#print(curtile)
			get_tree().queue_delete(curtile)
			print(chosen_side)
		3:
			var curtile = Global.find_tile(Vector2(align(-1, roomw), align(roundi(roomh / 2), roomh)))
			#print(curtile)
			get_tree().queue_delete(curtile)
			print(chosen_side)
		4:
			var curtile = Global.find_tile(Vector2(align(roomh + 1, roomh), align(roundi(roomh / 2), roomh)))
			#print(curtile)
			get_tree().queue_delete(curtile)
			print(chosen_side)
	#for side in range(4):
		#

func align(num, maxnum):
	#print(num - round(maxnum / 2))
	return (num - round(maxnum / 2)) * Global.tilesize
