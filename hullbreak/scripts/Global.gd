extends Node

var tilesize = 32
var energy = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_collision(pos):
	var tile = find_tile(pos)
	if tile != null:
		if tile.collision == true:
			return true
	return false


#func check_collision(pos):
	#var tiles = get_tree().get_nodes_in_group("tile")
	#var has_col = false
	#for i in tiles:
		#if i.global_position == pos and i.collision == true:
			#has_col = true
	#return has_col

func check_hover(pos):
	var tile = find_tile(pos)
	if tile != null:
		return tile
	return null

func find_tile(pos):
	var tiles = get_tree().get_nodes_in_group("tile")
	for i in tiles:
		if i.global_position == pos:
			return i
	return null
