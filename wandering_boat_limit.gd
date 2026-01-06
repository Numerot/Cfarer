extends StaticBody2D
@onready var boat = get_node("/root/Node2D/Boat")
@onready var player = get_node("/root/Node2D/Player")

func _ready() -> void:
	add_collision_exception_with(boat)

#func _physics_process(delta: float) -> void:
	#if player.boatMode == false:
		#remove_collision_exception_with(boat)
	#if player.boatMode == true:
		#add_collision_exception_with(boat)
