
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	hide()
	pass

func _draw():
	draw_line(Vector2(-20, -20), Vector2(20, -20), Color(255,255,255))
	draw_line(Vector2(20, -20), Vector2(20, 20), Color(255,255,255))
	draw_line(Vector2(20, 20), Vector2(-20, 20), Color(255,255,255))
	draw_line(Vector2(-20, 20), Vector2(-20, -20), Color(255,255,255))
	

