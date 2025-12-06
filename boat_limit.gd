extends StaticBody2D

func _ready() -> void:
	var player = get_node("/root/Node2D/Player")
	add_collision_exception_with(player)
