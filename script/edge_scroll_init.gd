extends CanvasLayer

export(int) var margin = 16

func _ready():
	print("Hello")
	#We create 4 Area2D's
	var up = StaticBody2D.new()
	var down = StaticBody2D.new()
	var left = StaticBody2D.new()
	var right = StaticBody2D.new()
	#Set their shapes to the screen edges
	var screen_bounds = OS.get_window_size()
	var up_shape = RectangleShape2D.new()
	var down_shape = RectangleShape2D.new()
	var left_shape = RectangleShape2D.new()
	var right_shape = RectangleShape2D.new()
	
	up_shape.set_extents(Vector2(screen_bounds.x / 2, margin))
	down_shape.set_extents(Vector2(screen_bounds.x / 2, margin))
	left_shape.set_extents(Vector2(margin, screen_bounds.y / 2))
	right_shape.set_extents(Vector2(margin, screen_bounds.y / 2))
	
	
	up.set_pos(Vector2(screen_bounds.x / 4, 0))
	down.set_pos(Vector2(screen_bounds.x / 4, screen_bounds.y /2))
	left.set_pos(Vector2(0, screen_bounds.y / 4))
	right.set_pos(Vector2(screen_bounds.x/2, screen_bounds.y / 4))
	
	up.add_shape(up_shape)
	down.add_shape(down_shape)
	left.add_shape(left_shape)
	right.add_shape(right_shape)
	
	#Disable collisions
	
	up.set_layer_mask(0)
	down.set_layer_mask(0)
	left.set_layer_mask(0)
	right.set_layer_mask(0)
	up.set_collision_mask(0)
	down.set_collision_mask(0)
	left.set_collision_mask(0)
	right.set_collision_mask(0)
	
	up.set_pickable(true)
	down.set_pickable(true)
	left.set_pickable(true)
	right.set_pickable(true)
	
	#Bind scripts to them
	var script = preload("res://script/edge_scroll.gd")
	
	up.set_script(script)
	down.set_script(script)
	left.set_script(script)
	right.set_script(script)
	
	#Set connections
	up.connect("mouse_enter", up, "_on_mouse_enter", [0])
	up.connect("mouse_exit", up, "_on_mouse_exit")
	down.connect("mouse_enter", down, "_on_mouse_enter", [1])
	down.connect("mouse_exit", down, "_on_mouse_exit")
	left.connect("mouse_enter", left, "_on_mouse_enter", [2])
	left.connect("mouse_exit", left, "_on_mouse_exit")
	right.connect("mouse_enter", right, "_on_mouse_enter", [3])
	right.connect("mouse_exit", right, "_on_mouse_exit")
	
	#Add to scene
	add_child(up)
	add_child(down)
	add_child(left)
	add_child(right)
	
	up.set_name("up")
	down.set_name("down")
	left.set_name("left")
	right.set_name("right")
	
