extends Node2D

@export var rooms: Dictionary = {
	"homeroom": preload("res://rooms/home_room.tscn"),
	"basic": preload("res://rooms/room_1.tscn"),
}

@export var cell_size = 9
@export var cells = 6
@export var used_cells = []
@export var bounds = 100

var cur_cell = Vector2(0, 0)

func _ready() -> void:
	#add_child(rooms["homeroom"].instantiate())
	add_room(Vector2(0, 0))
	for i in range(0, 4):
		#add_room(Vector2(0, i))
		var goodcell = true
		var nextcell = cur_cell + rand_dir()
		print(nextcell)
		for c in used_cells:
			if nextcell == c:
				goodcell = false
		if goodcell == true:
			add_room(nextcell)
	
	fill()

func _process(delta: float) -> void:
	pass

func add_room(cell):
	var new_room = rooms["basic"].instantiate()
	new_room.global_position = cell2pos(cell)
	add_child(new_room)
	used_cells.append(cell)
	cur_cell = cell

func pos2cell(pos):
	var c = pos / Global.tilesize / cell_size
	return roundi(c)

func cell2pos(cell):
	return cell * cell_size * Global.tilesize

func rand_dir():
	if randi_range(0, 1) == 1:
		if randi_range(0, 1) == 1:
			return Vector2(0, 1)
		else:
			return Vector2(0, -1)
		return 
	else:
		if randi_range(0, 1) == 1:
			return Vector2(1, 0)
		else:
			return Vector2(-1, 0)

func fill():
	pass
