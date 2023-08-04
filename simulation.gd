extends Node2D


const SHAPE = preload("res://bullet_shape.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for data in DanmakuData.shapes:
		var shape = SHAPE.instantiate()
		shape.shape_data = data
		add_child(shape)

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		SceneManager.change_scene("res://ui.tscn")
