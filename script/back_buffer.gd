
extends BackBufferCopy

# member variables here, example:
# var a=2
# var b="textvar"

export(String) var Z_LAYER

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_z_as_relative(false)
	set_z(Globals.get(Z_LAYER))
	set_copy_mode(COPY_MODE_VIEWPORT)
	pass


