extends TabContainer

const SHAPE_MENU = preload("res://shape_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if DanmakuData.has_shapes_been_saved:
		for child in get_children():
			child.name = "ignore THIS bullshit"
			child.queue_free()
		var index = 1
		for data in DanmakuData.shapes:
			var menu = SHAPE_MENU.instantiate()
			if index == 1:
				menu.name = "Shape"
			else:
				menu.name = "Shape " + str(index) 
			index = index + 1
			add_child(menu)
			menu.from_shape_data(data)
