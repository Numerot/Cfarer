extends AudioStreamPlayer

func _on_sail_dig_item_found() -> void:
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -130
	play(0.0)


func _on_crow_item_found() -> void:
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -130
	play(0.0)
