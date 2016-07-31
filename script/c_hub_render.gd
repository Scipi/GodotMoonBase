
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var visible = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func add_child(node):
	.add_child(node)
	update()

func remove_child(node):
	.remove_child(node)
	update()

func revealed():
	visible = true
	update()

func hidden():
	visible = false
	update()

func _draw():
	if visible:
		var pos = get_pos()
		var children = get_children()
		for c in children:
			var c_pos = c.get_pos()
			draw_line(pos, c_pos, Color(255, 255, 255))