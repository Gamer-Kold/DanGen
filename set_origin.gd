extends PanelContainer

var origin_pos : Vector2
signal origin_selected(origin : Vector2)

func _process(_delta):
	$Sprite2D.position = origin_pos
	if Input.is_action_just_pressed("left_click"):
		origin_pos = get_global_mouse_position()
	elif Input.is_action_just_pressed("ui_cancel"):
		emit_signal("origin_selected", origin_pos)
		queue_free()
