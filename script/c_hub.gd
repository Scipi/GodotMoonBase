
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

export(String) var type

export(String, "Team_1", "Team_2") var team = "Team_1"
export(String, "Player_1", "Player_2") var player_owner = "Player_1"

export(int) var health

signal selected
signal deselected
signal revealed
signal hidden
signal radar_revealed
signal radar_hidden

var HQ = true
var visible = true
var radar_visible = true

var resources = 0
var max_resources = 100
var deficit = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_z_as_relative(false)
	set_z(Globals.get("HUB_Z"))
	
	if team == "Team_1":
		pass
	elif team == "Team_2":
		get_node("Sprite").set_modulate(Color(100, 0, 0))
	
	if team != Globals.get("PLAYER_TEAM"):
		set_visible(false)
		set_radar_visible(false)
		if has_node("fov"):
			get_node("fov").hide()

func select():
	emit_signal("selected")

func deselect():
	emit_signal("deselected")

func set_radar_visible(v):
	radar_visible = v
	if v and !visible:
		emit_signal("radar_revealed")
	else:
		emit_signal("radar_hidden")

func set_visible(v):
	visible = v
	if v:
		emit_signal("revealed")
	else:
		emit_signal("hidden")

func add_connection(c, pos):
	c.team = team
	c.player_owner = player_owner
	c.HQ = false
	#c.set_global_pos(pos)
	if c.valid_pos(get_world_2d().get_direct_space_state(), pos, self):
		get_node("Connections").add_child(c)
		c.set_global_pos(pos)

func valid_pos(space, pos, hub):
	var valid = false
	var params = Physics2DShapeQueryParameters.new()
	var poly = get_node("CollisionPolygon2D")
	var shape
	if poly.get_build_mode() == 0:
		shape = ConvexPolygonShape2D.new()
		shape.set_points(poly.get_polygon())
	else:
		shape = ConcavePolygonShape2D.new()
		shape.set_segments(poly.get_polygon())
	
	var radius = hub.get_node("building_range").get_shape(0).get_radius()
	var dist = hub.get_global_pos().distance_to(pos)
	valid = dist <= radius
	
	
	var matrix = Matrix32(0, pos)
	params.set_transform(matrix)
	params.set_shape(shape)
	params.set_object_type_mask(space.TYPE_MASK_AREA)
	
	params.set_layer_mask(Globals.get("WORLD_LAYER"))
	var cols = space.intersect_shape(params, 128)
	valid = valid and cols.empty()
	
	params.set_layer_mask(Globals.get("SHIELD_LAYER"))
	cols = space.intersect_shape(params, 128)
	for c in cols:
		if c.collider.get_parent().team != team:
			valid = false
			break
	
	return valid

func damage(amt):
	health -= amt
	if health <= 0:
		if !HQ:
			var p = get_parent()
			var tree = get_tree()
			p.remove_child(self)
			tree.get_root().add_child(self)
		self.queue_free()