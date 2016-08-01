
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_layer_mask(Globals.get("BUILD_RANGE_LAYER"))
	pass


func select():
	get_node("range").show()
	get_node("range_transparent").show()
func deselect():
	get_node("range").hide()
	get_node("range_transparent").hide()