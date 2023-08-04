extends Node2D

const BULLET = preload("res://bullet.tscn")
var stationary_frame : Node2D
var shape_data : ShapeData
var bullet_sprite : ImageTexture
var time = 0

func _process(delta):
	time = time + delta
	var bullets_fired = floor(time * shape_data.fire_rate)
	if bullets_fired > 0:
		time = 0
		for i in range(bullets_fired):
			var bullet = BULLET.instantiate()
			bullet.position = shape_data.origin
			bullet.shape_data = shape_data
			bullet.bullet_sprite = bullet_sprite
			stationary_frame.add_child(bullet)
			bullet.rotate(rotation + get_parent().rotation + get_parent().get_parent().rotation)
