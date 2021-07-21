extends StaticBody2D

enum {
	OPEN,
	CLOSED
}

var state = CLOSED
var item = null
var SwordClass = preload("res://scenes/Item.tscn")

onready var open_sprite = $OpenSprite
onready var closed_sprite = $ClosedSprite

signal chest_opened(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	item = SwordClass.instance()


func update_sprite():
	match state:
		OPEN:
			open_sprite.visible = true
			closed_sprite.visible = false
		CLOSED:
			open_sprite.visible = false
			closed_sprite.visible = true


func _on_Hitbox_area_entered(_area):
	print("Chest interacted with")
	if state == CLOSED:
		state = OPEN
		update_sprite()
		emit_signal("chest_opened", item)
