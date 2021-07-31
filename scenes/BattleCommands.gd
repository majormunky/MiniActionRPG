extends Panel

onready var item_list = $ItemList
var commands = [
	"Fight",
	"Items",
	"Magic",
	"Run"
]

func _ready():
	for item in commands:
		item_list.add_item(item)


func _on_ItemList_item_selected(index):
	print(commands[index])
