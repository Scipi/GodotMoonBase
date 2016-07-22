
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON and event.is_pressed():
		Globals.set("selection", weakref(get_parent()))
		get_node("s_box_render").show()
	
func deselect():
	Globals.set("selection", null)
	get_node("s_box_render").hide()
	