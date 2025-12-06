extends StaticBody2D

func _ready() -> void:
	var boat = get_node("/root/Node2D/Boat")
	add_collision_exception_with(boat)
