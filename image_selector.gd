@tool
extends HBoxContainer

@export var label = ""
@export var is_int = false
var value := 16
const default_image = preload("res://icon.png")
var prev_path
func _ready():
	if not Engine.is_editor_hint() and not DanmakuData.has_shapes_been_saved:
		var image = Image.new()
		image.copy_from(default_image)
		image.resize(16, 16, Image.INTERPOLATE_NEAREST)
		owner.image.copy_from(default_image)
		$TextureRect.texture = ImageTexture.create_from_image(image)
		

func _process(_delta):
	$RichTextLabel.text = label

func change_value(_value):
	$SpinBox.value = _value

func load_image(path):
	_on_file_dialog_file_selected(path)

func _on_button_pressed():
	get_node("%FileDialog").visible = true

func _on_file_dialog_file_selected(path):
	var image = Image.new()
	if path:
		image.load(path)
		prev_path = path
	else:
		image.copy_from(default_image)
	image.resize($SpinBox.value, $SpinBox.value, Image.INTERPOLATE_BILINEAR)
	$TextureRect.texture = ImageTexture.create_from_image(image)
	owner.image = image

func _on_spin_box_value_changed(_value):
	value = _value
	_on_file_dialog_file_selected(prev_path)
