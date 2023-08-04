extends Node2D

var stationary_frame : Node2D
var shape_data : ShapeData
var bullet_sprite : ImageTexture
const BULLET_ARM = preload("res://bullet_arm.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var angle = 0
	for i in range(shape_data.bullets_per_array):
		var bullet_arm = BULLET_ARM.instantiate()
		bullet_arm.stationary_frame = stationary_frame
		bullet_arm.shape_data = shape_data
		bullet_arm.rotation_degrees = angle
		bullet_arm.bullet_sprite = bullet_sprite
		add_child(bullet_arm)
		angle = angle + shape_data.space_in_array / \
			   (shape_data.bullets_per_array -1)
