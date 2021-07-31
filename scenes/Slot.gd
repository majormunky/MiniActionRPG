extends Panel

var item = null
var test_item = preload("res://scenes/Item.tscn")

var empty_tex = preload("res://assets/images/ui/empty-panel.png")
var default_tex = preload("res://assets/images/ui/panel.png")
var selected_tex = preload("res://assets/images/ui/selected-panel.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null
var selected_style: StyleBoxTexture = null
var is_selected = false

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	selected_style = StyleBoxTexture.new()
	
	default_style.texture = default_tex
	empty_style.texture = empty_tex
	selected_style.texture = selected_tex
	
	refresh_style()

func refresh_style():
	if is_selected:
		set("custom_styles/panel", selected_style)
	elif item == null:
		set("custom_styles/panel", empty_style)
	else:
		set("custom_styles/panel", default_style)


func pick_from_slot():
	remove_child(item)
	var main_menu = find_parent("MainMenu")
	main_menu.add_child(item)
	item = null
	refresh_style()


func put_into_slot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var main_menu = find_parent("MainMenu")
	main_menu.remove_child(item)
	add_child(item)
	refresh_style()


func select_slot():
	is_selected = true
	refresh_style()


func deselect_slot():
	is_selected = false
	refresh_style()
