extends Node2D

onready var main_menu = $MainMenu
onready var dialog = $Dialog
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		if main_menu.visible:
			main_menu.visible = false
			get_tree().paused = false
		else:
			get_tree().paused = true
			main_menu.popup()


func _on_Chest_chest_opened(item):
	var chest_text = null;
	if item == null:
		chest_text = "Chest is empty!"
	else:
		chest_text = "Chest contains: " + str(item.item_name)
		PlayerData.add_item(item)

	dialog.set_dialog_text(chest_text)
	dialog.popup()
	


func _on_MainMenu_about_to_show():
	pass
	# var test_item = PlayerData.player_data["inventory"][0]
	#main_menu.find_node("Panel/MarginContainer/VBoxContainer/GridContainer/Slot1/Icon")
