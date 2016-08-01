
extends Label

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	var string = ""
	var eco = Globals.get("ECONOMY")
	for e in eco:
		string += e + ": " + str(eco[e]) + "\n"
	
	set_text(string)


