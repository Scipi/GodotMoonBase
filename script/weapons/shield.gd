
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

var max_health = 100
var health = max_health
var team = ""
var recovery_rate = 10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	team = get_parent().team
	set_z_as_relative(false)
	set_z(Globals.get("SHIELD_Z"))
	set_layer_mask(Globals.get("SHIELD_LAYER"))
	pass

func _process(delta):
	health += recovery_rate * delta
	if health >= max_health:
		health = max_health
		set_process(false)
		get_node("shield_mask").show()
		set_layer_mask(1024)

func damage(dmg):
	health -= dmg
	if health <= 0:
		get_node("shield_mask").hide()
		set_layer_mask(0)
	
	var timer = get_node("recharge_delay")
	timer.stop()
	timer.start()
	set_process(false)

func start_recovery():
	set_process(true)