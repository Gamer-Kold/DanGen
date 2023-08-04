extends HBoxContainer

var value : Vector2
const ORIGIN_SETTER = preload("res://set_origin.tscn")

func _ready():
	value = get_viewport_rect().size / 2

func _on_button_pressed():
	var setter = ORIGIN_SETTER.instantiate()
	setter.origin_selected.connect(_on_origin_selected)
	setter.origin_pos = value
	get_tree().root.add_child(setter)

func _on_origin_selected(origin):
	value = origin
