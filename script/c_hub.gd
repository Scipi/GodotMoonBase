
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

export(String) var type

export(String, "Team_1", "Team_2") var team

export(int) var health

var HQ = true

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
	c.HQ = false
	c.set_pos(Vector2(0, 0))
	get_node("Connections").add_child(c)
	c.set_global_pos(pos)

func valid_pos():
	return true

func damage(amt):
	health -= amt
	if health <= 0:
		if !HQ:
			var p = get_parent()
			var tree = get_tree()
			p.remove_child(self)
			tree.get_root().add_child(self)
		self.queue_free()