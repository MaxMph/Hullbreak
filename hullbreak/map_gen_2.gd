extends Node2D

@export var cell_size = 7
@export var room_size = 5
@export var cells = 6

@export var used_cells = []

@export var bounds = 100

@export var wall: PackedScene

var cur_cell = Vector2(0, 0)

func _ready() -> void:
	for w in range(bounds):
		for h in range(bounds):
			var new_wall = wall.instantiate()
			new_wall. global_position = Vector2(w - bounds/2, h - bounds/2) * Global.tilesize
			add_child(new_wall)
	
#	startroom()
	add_room(Vector2(0, 0))
	add_room(Vector2(1, 0))
	add_room(Vector2(-1, 0))
	add_room(Vector2(0, -1))
	#add_room(1)
	#choose next cell
	



func _process(delta: float) -> void:
	pass

func startroom():
	for w in range(room_size):
		for h in range(room_size):
			var tile =  Global.find_tile(Vector2(align(w, room_size), align(h, room_size)))
			#print(w)
			if tile != null:
				get_tree().queue_delete(tile)
			#var new_wall = wall.instantiate()
			#new_wall. global_position = Vector2(w - room_size/2, h - room_size/2) * Global.tilesize
			#add_child(new_wall)

func add_room(cell):
	for w in range(room_size):
		for h in range(room_size):
			var tile =  Global.find_tile(Vector2(cell2pos(cell.x) + align(w, room_size), cell2pos(cell.y) + align(h, room_size)))
			if tile != null:
				get_tree().queue_delete(tile)
	
	make_hall2(cell)
	cur_cell = cell

func make_hall(cell):
	if cell.x != cur_cell.x:
		if cell.x > cur_cell.x: #right
			for i in range(-1, 1):
				var tile =  Global.find_tile(Vector2(cell2pos(cell.x) + align(i, cell_size), cell2pos(cell.y) + align(round(cell_size / 2), cell_size)))
				if tile != null:
					get_tree().queue_delete(tile)
				
		else: #left
			pass
			#var tile =  Global.find_tile(Vector2(cell2pos(cell.x) + align(cell_size, cell_size), cell2pos(cell.y) + align(round(cell_size / 2), cell_size)))
			#if tile != null:
				#get_tree().queue_delete(tile)
	else:
		if cell.y > cur_cell.y: #up
			pass
		else: # down
			pass

func make_hall2(cell):
	if cell.x == cur_cell.x:
		for i in range(cell.y * cell_size, cur_cell.y * cell_size):
			print(i)
			#Global.find_tile()
			var tile =  Global.find_tile(Vector2( cell2pos(cell.x), cell2pos(cell.y) + align(i, cell_size)))
			if tile != null:
				get_tree().queue_delete(tile)
	elif cell.y == cur_cell.y:
		print(cell, cur_cell)
		var _range
		if cur_cell.x > cell.x:
			
			_range = range(cell.x * cell_size, cur_cell.x * cell_size)
		else:
			_range = range(cur_cell.x * cell_size, cell.x * cell_size)
		
		for i in _range:
			print(i)
			#Global.find_tile()
			var tile =  Global.find_tile(Vector2(cell2pos(cell.x) + align(i, cell_size), cell2pos(cell.y)))
			if tile != null:
				get_tree().queue_delete(tile)
	#for i in range(cell_size):

func align(num, maxnum):
	return (num - round(maxnum / 2)) * Global.tilesize

func pos2cell(pos):
	var c = pos / Global.tilesize / cell_size
	return roundi(c)

func cell2pos(cell):
	return cell * cell_size * Global.tilesize
