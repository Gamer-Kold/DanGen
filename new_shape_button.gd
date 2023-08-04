extends Button

const SHAPE_MENU = preload("res://shape_menu.tscn")
var number = 2

func _on_pressed():
	var menu = SHAPE_MENU.instantiate()
	menu.name = "Shape " + str(number)
	number = number + 1 
	get_node("%TabContainer").add_child(menu)
