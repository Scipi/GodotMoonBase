
extends Camera2D

# member variables here, example:
# var a=2
# var b="textvar"

var dragging = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input(event):
    if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_MIDDLE:
        dragging = event.is_pressed()
    elif event.type == InputEvent.MOUSE_MOTION and dragging:
        set_offset( get_offset() - event.relative_pos )