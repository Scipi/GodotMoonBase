
extends StaticBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var scroll_speed = 64*4
var vec = Vector2(0, 0)
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	return

func _process(delta):
	var motion = vec * scroll_speed * delta
	var camera = Globals.get("camera")
	camera.set_offset(camera.get_offset() + motion)

func _on_mouse_enter(dir):
	if dir == 0:
		vec.y = -1
	elif dir == 1:
		vec.y = 1
	elif dir == 2:
		vec.x = -1
	elif dir == 3:
		vec.x = 1
	set_process(true)

func _input_event(viewport, event, shape_idx):
	pass

func _on_mouse_exit():
	vec = Vector2(0, 0)
	set_process(false)

func _draw():
	var bounds = get_shape(0).get_extents()
	var rect = Rect2(get_pos(), bounds)
	draw_rect(rect, Color(255, 0, 0))
