
extends StaticBody2D

# member variables here, example:
# var a=2
# var b="textvar"


var health = 100
var team = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	team = get_parent().team
	pass

func damage(dmg):
	health -= dmg
	if health <= 0:
		get_node("../shield_mask").hide()
		set_layer_mask(0)