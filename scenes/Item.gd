extends Node2D

onready var texture_rect = $TextureRect
onready var label = $Label
var item_name
var item_quantity


func _ready():
	var item_data = GameData.item_data[item_name]
	texture_rect.texture = load("res://assets/images/" + item_data["category"] + "/" + item_data["image_name"])
	item_quantity = 1

	if item_data["stack_size"] == 1:
		label.visible = false
	else:
		label.visible = true
		update_label_text(item_quantity)


func set_item(objname):
	item_name = objname


func add_item_quantity(amount):
	item_quantity += amount
	update_label_text(item_quantity)


func remove_item_quantity(amount):
	item_quantity -= amount
	update_label_text(item_quantity)


func update_label_text(text):
	label.text = String(text)
