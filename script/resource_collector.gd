
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func collect():
	var res = get_overlapping_areas()
	var amt = 0
	for r in res:
		amt += r.extract(1)
	var eco = Globals.get("ECONOMY")
	var player = get_parent().player_owner
	eco[player] += amt
