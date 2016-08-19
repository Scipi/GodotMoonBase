
extends Camera2D

# member variables here, example:
# var a=2
# var b="textvar"

var dragging = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	Globals.set("camera", self)
	pass

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_MIDDLE:
		var p = !event.is_pressed()
		set_v_drag_enabled(p)
		set_h_drag_enabled(p)
	elif event.type == InputEvent.MOUSE_MOTION:
		set_pos( get_pos() - event.relative_pos )