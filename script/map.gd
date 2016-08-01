
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("ACTIVE_PLAYERS", ["Player_1", "Player_2"])
	Globals.set("PLAYER_TEAMS", {Player_1 = "Team_1", Player_2 = "Team_2"})
	Globals.set("PLAYER", "Player_1")
	Globals.set("ECONOMY", {Player_1 = 50, Player_2 = 50})
	
	get_node("fog_of_war").show()
	get_node("fog_of_war").set_z_as_relative(false)
	get_node("fog_of_war").set_z(Globals.get("FOG_OF_WAR_Z"))
	
	var camera = preload("res://scenes/camera.tscn").instance()
	camera.make_current()
	add_child(camera)
	pass


