extends Popup


onready var inventory_slots = $HBoxContainer/GridContainer
const SlotClass = preload("res://scenes/Slot.gd")
var holding_item = null
var selected_slot = 0


func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])
		if inv_slot.get_index() == selected_slot:
			inv_slot.select_slot()


func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		print("Mouse button event")
		if event.button_index == BUTTON_LEFT && event.pressed:
			print("event!")
			if holding_item != null:
				if !slot.item:
					slot.put_into_slot(holding_item)
					holding_item = null
				else:
					print("In this area")
					var temp_item = slot.item
					slot.pick_from_slot()
					temp_item.global_position = event.global_position
					slot.put_into_slot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pick_from_slot()
				holding_item.global_position = get_global_mouse_position()
				print(holding_item)
	

func _input(_event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
