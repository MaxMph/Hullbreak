extends Node2D

@export var rooms: Dictionary = {
	"homeroom": preload("res://rooms/home_room.tscn"),
	"basic": preload("res://rooms/room_1.tscn"),
	"fill": preload("res://rooms/filled_room.tscn"),
}

@export var rooms_array: Array = [preload("res://rooms/room_1.tscn"), preload("res://rooms/room_2.tscn"), preload("res://rooms/room_3.tscn")]

@export var cell_size = 9
@export var max_cells = 6
@export var cells = 0
@export var used_cells = []
@export var bounds = 20

var cur_cell = Vector2(0, 0)

func _ready() -> void:
	add_child(rooms["homeroom"].instantiate())
	#add_room(Vector2(0, 0))
	used_cells.append(Vector2(0, 0))
	cur_cell = Vector2(0, 0)
	get_next_room()
	cur_cell = Vector2.ZERO
	cells = 0
	get_next_room()
	cur_cell = Vector2.ZERO
	cells = 0
	get_next_room()
	
	fill()

func _process(delta: float) -> void:
	pass

func get_next_room():
	while cells < max_cells:
		#add_room(Vector2(0, i))
		var goodcell = true
		var nextcell = cur_cell + rand_dir()
		print(nextcell)
		for c in used_cells:
			if nextcell == c:
				goodcell = false
		if goodcell == true:
			add_room(nextcell)
			cells += 1


func add_room(cell):
	#var new_room = rooms["basic"].instantiate()
	var new_room = rooms_array[randi_range(0, rooms_array.size() - 1)].instantiate()
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
	for x in range(bounds):
		for y in range(bounds):
			if check_cell(Vector2(x, y)) == false:
				var newroom = rooms["fill"].instantiate()
				newroom.global_position = cell2pos(Vector2(x, y))
				add_child(newroom)
				used_cells.append(Vector2(x, y))

func check_cell(cell):
	#var usable = true
	for i in used_cells:
		if i == cell:
			return true
	return false
