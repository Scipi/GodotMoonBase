tool
extends BackBufferCopy

# member variables here, example:
# var a=2
# var b="textvar"

export(int) var mask_z_offset setget mask_z_offset_set

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_rect(self.get_item_and_children_rect())
	for m in get_children():
		m.set_use_parent_material(true)
		m.set_z(self.get_z() + mask_z_offset)
	pass

func update_rect():
	self.set_rect(self.get_item_and_children_rect())

func mask_z_offset_set(val):
	mask_z_offset = val
	for m in get_children():
		m.set_z(self.get_z() + mask_z_offset)

func add_child(node):
	if node extends CanvasItem:
		node.set_use_parent_material(true)
	.add_child(node)
	update_rect()

func remove_child(node):
	.remove_child(node)
	update_rect()