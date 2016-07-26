extends Node

var WORLD_LAYER = 0x01
var SELECTION_LAYER = 0x02
func _ready():
	Globals.set("WORLD_LAYER", WORLD_LAYER)
	Globals.set("SELECTION_LAYER", SELECTION_LAYER)