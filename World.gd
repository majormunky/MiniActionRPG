extends Node2D

onready var main_menu = $MainMenu
onready var dialog = $Dialog
onready var player = $Player
onready var Item = preload("res://scenes/Item.tscn")
onready var Chest = preload("res://scenes/Chest.tscn")
onready var Slime = preload("res://scenes/Slime.tscn")

onready var swordArt = load("res://assets/images/Weapon/WoodenSword.png")
onready var armorArt = load("res://assets/images/armor/armor_06.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_chests()
	
	var test_slime = Slime.instance()
	test_slime.position.x = 500
	test_slime.position.y = 300
	
	get_node("Enemies").add_child(test_slime)


func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		if main_menu.visible:
			main_menu.visible = false
			get_tree().paused = false
		else:
			get_tree().paused = true
			main_menu.popup()


func setup_chests():
	var sword = Item.instance()
	sword.set_item("Wooden Sword")
	
	var chest1 = Chest.instance()
	chest1.position.x = 500
	chest1.position.y = 300
	chest1.item = sword
	chest1.connect("chest_opened", self, "_on_Chest_chest_opened")
	
	get_node("Items").add_child(chest1)
	
	var armor = Item.instance()
	armor.set_item("Leather Armor")
	
	var chest2 = Chest.instance()
	chest2.position.x = 550
	chest2.position.y = 300
	chest2.item = armor
	chest2.connect("chest_opened", self, "_on_Chest_chest_opened")
	get_node("Items").add_child(chest2)
	
	

func _on_Chest_chest_opened(item):
	print("ON CHEST OPENED", item)
	var chest_text = null;
	if item == null:
		chest_text = "Chest is empty!"
	else:
		print(item.item_name)
		chest_text = "Chest contains: " + str(item.item_name)
		PlayerData.add_item(item)

	dialog.set_dialog_text(chest_text)
	dialog.popup()


func _on_MainMenu_about_to_show():
	print("showing main menu")
	main_menu.update_items()


func _on_Player_player_interacted():
	if dialog and dialog.visible:
		dialog.visible = false
			
