extends Button




func _on_pressed():
	DanmakuData.shapes = []
	var index = 0
	for child in get_node("%TabContainer").get_children():
		var data = child.as_shape_data()
		data.index = index
		DanmakuData.shapes.append(data)
		index = index + 1
	DanmakuData.has_shapes_been_saved = true
	SceneManager.change_scene("res://simulation.tscn")

	
