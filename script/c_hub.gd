
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

export(String) var type

export(String, "Team_1", "Team_2") var team

export(int) var health

signal selected
signal deselected
signal revealed
signal hidden

var HQ = true
var visible = true
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	if team == "Team_1":
		pass
	elif team == "Team_2":
		get_node("Sprite").set_modulate(Color(100, 0, 0))
	
	if team != Globals.get("PLAYER_TEAM"):
		set_visible(false)
		if has_node("fov"):
			get_node("fov").hide()

func select():
	emit_signal("selected")

func deselect():
	emit_signal("deselected")

func set_visible(v):
	visible = v
	if v:
		emit_signal("revealed")
	else:
		emit_signal("hidden")

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