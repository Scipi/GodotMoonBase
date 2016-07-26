
extends Node2D

export(PackedScene) var bullet_type
export(float) var fire_rate

var timer = 0.0
onready var cooldown = 1/fire_rate
var primed = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	timer += delta
	if timer >= cooldown:
		timer = 0
		primed = true
		set_process(false)

func fire_at(target_pos):
	if primed:
		primed = false
		set_process(true)
		var b_inst = bullet_type.instance()
		b_inst.set_pos(get_global_pos())
		b_inst.dir = (target_pos - get_global_pos()).normalized()
		b_inst.look_at(target_pos)
		b_inst.team = get_parent().team
		get_tree().get_root().add_child(b_inst)
