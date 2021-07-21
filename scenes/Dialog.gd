extends Popup


onready var main_label = $Panel/MarginContainer/HBoxContainer/MainLabel

var dialog_text = null

func set_dialog_text(words):
	dialog_text = words
	main_label.text = dialog_text

