extends Sprite2D

var speed
var shape_data : ShapeData
var bullet_sprite : ImageTexture
var time 
# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	texture = bullet_sprite
	speed = shape_data.bullet_speed

func _process(delta):
	time = time + delta
	transform = transform.translated_local(Vector2.LEFT * speed * delta)
	speed = speed + shape_data.bullet_acceleration
	if time > shape_data.bullet_ttl:
		queue_free()
