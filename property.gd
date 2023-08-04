@tool
extends HBoxContainer

@export var label = ""
@export var is_int = false
@export var default_value : float = 0
var value = 0

func _ready():
	$TextEdit.value = default_value
	$RichTextLabel.tooltip_text = tooltip_text
func _process(_delta):
	$RichTextLabel.text = label
	$TextEdit.rounded = is_int

func change_value(new_val):
	$TextEdit.value = new_val

func _on_text_edit_value_changed(new_value):
	value = new_value
