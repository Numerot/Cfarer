extends AudioStreamPlayer

func _on_sail_dig_item_found() -> void:
	get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
	play(0.0)

func _on_crow_item_found() -> void:
	get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
	play(0.0)

func _on_shiny_dig_item_found() -> void:
	get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
	play(0.0)


func _on_test_dig_item_found() -> void:
	get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
	play(0.0)

func _on_area_2d_item_found() -> void:
	get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
	get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
	play(0.0)
