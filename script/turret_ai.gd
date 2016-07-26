
extends Node

var target = null

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func select_target(targets):
	if typeof(targets) == TYPE_ARRAY:
		if not targets.empty():
			target = targets[0] # Todo: Prioritize certain node types
			set_process(true)
	else:
		target = targets
		set_process(true)

func _process(delta):
	var t_ref = target.get_ref()
	if t_ref:
		get_node("../../weapon").fire_at(t_ref.get_global_pos())
	else:
		set_process(false)