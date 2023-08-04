extends Node2D

const BULLET_ARRAY = preload("res://bullet_array.tscn")
var shape_data : ShapeData
var bullet_sprite : ImageTexture
var spin_rate
var modifier = 1
func _ready():
	var angle = shape_data.starting_angle
	var image := Image.new()
	image.copy_from(shape_data.bullet_sprite)
	image.resize(shape_data.image_size, shape_data.image_size, Image.INTERPOLATE_BILINEAR)
	bullet_sprite = ImageTexture.create_from_image(image)
	spin_rate = shape_data.spin_rate
	position = shape_data.origin
	for i in range(shape_data.bullet_array_number):
		var array = BULLET_ARRAY.instantiate()
		array.stationary_frame = get_parent()
		array.bullet_sprite = bullet_sprite
		array.shape_data = shape_data
		array.rotation_degrees = angle
		add_child(array)
		angle = angle + shape_data.space_btw_array

func _process(_delta):
	rotation_degrees = rotation_degrees + spin_rate
	spin_rate = spin_rate + (shape_data.spin_rate_rate * modifier)
	if shape_data.max_spin_rate != 0:
		if spin_rate > shape_data.max_spin_rate or spin_rate < -shape_data.max_spin_rate:
			modifier = -1 * modifier
