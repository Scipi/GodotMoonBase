
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_area_enter( area ):
	if area.has_method("select"):
		area.select()
	pass # replace with function body


func _on_area_exit( area ):
	if area.has_method("deselect"):
		area.deselect()
	pass # replace with function body
