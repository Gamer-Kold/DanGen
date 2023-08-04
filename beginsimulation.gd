extends Button




func _on_pressed():
	DanmakuData.shapes = []
	for child in get_node("%TabContainer").get_children():
		DanmakuData.shapes.append(child.as_shape_data())
	DanmakuData.has_shapes_been_saved = true
	SceneManager.change_scene("res://simulation.tscn")

	
