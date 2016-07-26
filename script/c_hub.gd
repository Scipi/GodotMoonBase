
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

export(String) var type

export(String, "Team_1", "Team_2") var team

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	if team == "Team_1":
		pass
	elif team == "Team_2":
		get_node("Sprite").set_modulate(Color(100, 0, 0))
		

func select():
	get_node("SelectionBox").select()
	print(team)

func deselect():
	get_node("SelectionBox").deselect()

func add_connection(c, pos):
	c.team = team
	c.set_pos(Vector2(0, 0))
	get_node("Connections").add_child(c)
	c.set_global_pos(pos)

func valid_pos():
	return true