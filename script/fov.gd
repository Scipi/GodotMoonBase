
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
onready var team = get_parent().team
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_collision_mask(Globals.get("VISIBILITY_LAYER") | Globals.get("BULLET_LAYER"))
	pass

func _process(delta):
	var areas = get_overlapping_areas()
	for a in areas:
		var n = a.get_parent()
		if "team" in n and n.team != team and !n.visible:
			if team == Globals.get("PLAYER_TEAM"):
				n.set_visible(true)
