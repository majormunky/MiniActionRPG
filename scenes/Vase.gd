extends StaticBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_Hurtbox_area_entered(_area):
	queue_free()


func _on_InteractHitbox_area_entered(_area):
	print("Vase interacted with")
