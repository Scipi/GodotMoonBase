extends Node2D

export(int) var margin = 16
export(float) var speed = 512

func _ready():
	set_process(true)

func _process(delta):
	var m_pos = get_viewport().get_mouse_pos()
	var bounds = get_viewport_rect()
	var camera = Globals.get("camera")
	var c_pos = camera.get_offset()
	var vel = Vector2(0, 0)
	if m_pos.x < bounds.pos.x + margin:
		vel.x = -1
	if m_pos.x > bounds.pos.x + bounds.size.width - margin:
		vel.x = 1
	if m_pos.y < bounds.pos.y + margin:
		vel.y = -1
	if m_pos.y > bounds.pos.y + bounds.size.height - margin:
		vel.y = 1
	
	camera.set_offset(c_pos + vel * speed * delta)