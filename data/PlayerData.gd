extends Node

var player_data = {
	"stats": {
		"max_hp": 10,
		"current_hp": 10,
	},
	"inventory": []
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func add_item(item):
	player_data["inventory"].append(item)

func get_inventory():
	return player_data["inventory"]
