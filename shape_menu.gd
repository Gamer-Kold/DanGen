extends VBoxContainer

var image : Image = Image.new()


func as_shape_data():
	var data : ShapeData = ShapeData.new()
	data.bullet_array_number = $bullet_array_number.value
	data.bullets_per_array = $bullets_per_array.value
	data.space_btw_array = $space_btw_arrays.value
	data.space_in_array = $space_in_array.value
	data.starting_angle = $starting_angle.value
	data.spin_rate = $spin_rate.value
	data.spin_rate_rate = $spin_rate_rate.value
	data.max_spin_rate = $max_spin_rate.value
	data.fire_rate = $fire_rate.value
	data.bullet_speed = $bullet_speed.value
	data.bullet_acceleration = $bullet_acceleration.value
	data.image_size = $bullet_sprite.value
	data.bullet_ttl = $bullet_ttl.value
	data.origin = $bullet_origin.value
	data.bullet_sprite = image
	if $bullet_sprite.prev_path:
		data.bullet_sprite_path = $bullet_sprite.prev_path
	return data

func from_shape_data(data : ShapeData):
	$bullet_array_number.change_value(data.bullet_array_number)
	$bullets_per_array.change_value(data.bullets_per_array)
	$space_btw_arrays.change_value(data.space_btw_array)
	$space_in_array.change_value(data.space_in_array)
	$starting_angle.change_value(data.starting_angle)
	$spin_rate.change_value(data.spin_rate)
	$spin_rate_rate.change_value(data.spin_rate_rate)
	$max_spin_rate.change_value(data.max_spin_rate)
	$fire_rate.change_value(data.fire_rate)
	$bullet_speed.change_value(data.bullet_speed)
	$bullet_acceleration.change_value(data.bullet_acceleration) 
	$bullet_ttl.change_value(data.bullet_ttl)
	$bullet_sprite.change_value(data.image_size)
	$bullet_sprite.load_image(data.bullet_sprite_path)

