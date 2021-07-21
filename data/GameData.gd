extends Node

var item_data: Dictionary

func _ready():
	item_data = load_json_data("res://data/items.json")


func load_json_data(filepath):
	var json_data
	var file_data = File.new()
	file_data.open(filepath, File.READ)
	json_data = JSON.parse(file_data.get_as_text())
	return json_data.result
