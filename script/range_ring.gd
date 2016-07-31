
extends Node2D

export(Color) var color

# member variables here, example:
# var a=2
# var b="textvar"
onready var radius = get_parent().get_node("CollisionShape2D").get_shape().get_radius()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#hide()
	pass

func _draw():
	draw_circle(get_pos(), radius, color)
