
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var tile_name
var tile_type

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_shape(0).set_extents(Globals.get("TILEMAP_SIZE")/2)
	
	tile_type = find_node(tile_name)
	set_collision_mask(Globals.get("RESOURCE_LAYER"))
	pass

func degrade():
	if tile_type.get_parent() != self:
		tile_type = tile_type.get_parent()
		tile_name = tile_type.get_name()
		
		var p = get_parent()
		var tset = p.get_tileset()
		p.set_cellv(p.world_to_map(get_pos()), tset.find_tile_by_name(tile_name))

func extract(amt):
	var ret_amt = min(amt, tile_type.res_amt)
	tile_type.res_amt -= amt
	if tile_type.res_amt <= 0:
		tile_type.res_amt = 0
		degrade()
		var to_extract = amt - ret_amt
		ret_amt += min(to_extract, tile_type.res_amt)
		tile_type.res_amt -= to_extract
		if tile_type.res_amt <= 0:
			tile_type.res_amt = 0
	return ret_amt
