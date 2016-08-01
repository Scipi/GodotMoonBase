
extends Node2D
export(String) var Z_LAYER
# member variables here, example:
# var a=2
# var b="textvar"
onready var radius = get_parent().get_node("CollisionShape2D").get_shape().get_radius() - 3

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#hide()
	set_z_as_relative(false)
	set_z(Globals.get(Z_LAYER))
	pass

func _draw():
	draw_circle(get_pos(), radius, Color(0, 0, 0))
