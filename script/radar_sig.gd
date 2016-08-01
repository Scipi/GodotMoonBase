
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_z_as_relative(false)
	set_z(Globals.get("RADAR_SIG_Z"))
	pass


