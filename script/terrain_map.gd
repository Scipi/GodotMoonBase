
extends TileMap

# member variables here, example:
# var a=2
# var b="textvar"

onready var res = preload("res://scenes/tile.tscn")
func _ready():
	Globals.set("TILEMAP_SIZE", get_cell_size())
	# Called every time the node is added to the scene.
	# Initialization here
	var tiles = get_used_cells()
	var tset = get_tileset()
	for t in tiles:
		var res_i = res.instance()
		res_i.set_pos(map_to_world(t) + get_cell_size()/2)
		res_i.tile_name = tset.tile_get_name(get_cellv(t))
		add_child(res_i)
		
	pass


