
extends StaticBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var type = "HUB"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func select():
	get_node("SelectionBox").select()

func deselect():
	get_node("SelectionBox").deselect()

func add_connection(c, pos):
	get_node("Connections").add_child(c)
	c.set_global_pos(pos)

func valid_pos():
	return true