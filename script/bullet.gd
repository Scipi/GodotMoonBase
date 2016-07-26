
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

var dir = Vector2(0, 0)
var speed = 500
var damage = 10
var team = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	

func _fixed_process(delta):
	var vel = dir * speed * delta
	var pos = get_global_pos()
	pos += vel
	set_global_pos(pos)
	for a in get_overlapping_areas():
		hit_body(a)
	for b in get_overlapping_bodies():
		hit_body(b)

func hit_body(body):
	if (body.get("team") && body.team != team) || not body.get("team"):
		if body.has_method("damage"):
			body.damage(damage)
		self.queue_free()