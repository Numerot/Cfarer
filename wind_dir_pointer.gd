extends Sprite2D

func _physics_process(delta):
	rotation = get_node("/root/Node2D/Boat").windDir
