
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var paint = "c_hub"

func _ready():
	Globals.set("node_paint", weakref(self))
	set_process_unhandled_input(true)
	

func _unhandled_input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_RIGHT && !event.is_pressed():
		paint_node(get_global_mouse_pos())

func paint_node(pos):
	var selection = Globals.get("selection").selected
	for s in selection:
		var ref = selection[s].get_ref()
		if ref:
			if ref.type == "HUB":
				var node = load("res://scenes/" + paint + ".tscn").instance()
				
				ref.add_connection(node, pos)
				break
