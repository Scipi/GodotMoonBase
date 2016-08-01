
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var s_pos = Vector2(0, 0)
var c_pos = Vector2(0, 0)
var h_bound = Vector2(0, 0)
var selecting = false
onready var shape = RectangleShape2D.new()

var to_select = {}
var selected = {}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("selection", self)
	set_process_unhandled_input(true)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if selecting:
		var space = get_world_2d().get_direct_space_state()
		var params = Physics2DShapeQueryParameters.new()
		params.set_transform(Matrix32(0, s_pos - h_bound))
		params.set_shape(shape)
		params.set_object_type_mask(space.TYPE_MASK_AREA)
		params.set_layer_mask(Globals.get("SELECTION_LAYER"))
		
		var res = space.intersect_shape(params, 128)
		
		for k in to_select:
			var found = false
			for r in res:
				if k == r.rid:
					found = true
					res.erase(r)
					break
			if not found:
				to_select.erase(k)
			
		
		for r in res:
			if r.collider.has_method("select"):
				to_select[r.rid] = r.collider.get_owner()
	

func free():
	var s = Globals.get("selection")
	if self.get_instance_ID() == s.get_instance_ID():
		Globals.set("selection", null)
	
	self.free()

func _unhandled_input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_LEFT && event.is_pressed():
		selecting = true
		s_pos = get_global_mouse_pos()
		c_pos = s_pos
		shape.set_extents(Vector2(1, 1))
		
		for k in selected:
			var ref = selected[k].get_ref()
			if ref:
				ref.deselect()
		
		selected = {}
		
		update()
	if event.type == InputEvent.MOUSE_MOTION && selecting:
		c_pos = get_global_mouse_pos()
		h_bound = (s_pos - c_pos) / 2
		shape.set_extents(h_bound)
		update()
	
	if event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_LEFT  && !event.is_pressed():
		selecting = false
		selected = to_select
		to_select = {}
		for k in selected:
			var ref = selected[k].get_ref()
			if ref:
				ref.select()
		update()

func _draw():
	if selecting:
		draw_line(s_pos, Vector2(c_pos.x, s_pos.y), Color(255, 255, 255))
		draw_line(Vector2(c_pos.x, s_pos.y), c_pos, Color(255, 255, 255))
		draw_line(c_pos, Vector2(s_pos.x, c_pos.y), Color(255, 255, 255))
		draw_line(Vector2(s_pos.x, c_pos.y), s_pos, Color(255, 255, 255))
	
	