
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func select():
	#Globals.get("selection").set(weakref(get_parent()))
	get_node("s_box_render").show()
	
func deselect():
	#Globals.get("selection").unset()
	get_node("s_box_render").hide()

func get_owner():
	return weakref(get_parent())