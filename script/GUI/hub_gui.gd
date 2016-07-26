
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func button_pressed(type):
	if Globals.has("node_paint"):
		var ref = Globals.get("node_paint").get_ref()
		if ref:
			ref.paint = type

