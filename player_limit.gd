extends StaticBody2D
@onready var boat = get_node("/root/Node2D/Boat")
@onready var player = get_node("/root/Node2D/Player")


func _ready() -> void:
	add_collision_exception_with(boat)
