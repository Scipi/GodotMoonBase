
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	var valid_targets = []
	var team = get_parent().team
	
	var targets = get_overlapping_areas()
	for t in targets:
		if t.get("team") and t.team != team:
			valid_targets.push_back(weakref(t))
	
	get_node("../scripts/ai").select_target(valid_targets)

