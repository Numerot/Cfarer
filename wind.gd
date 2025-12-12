extends AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").boatMode == true:
		visible = true
		var boat = get_node("/root/Node2D/Boat/BoatGuy")
		play("gust")
	else:
		visible = false
		play("default")

func _on_animation_looped() -> void:
	var boat = get_node("/root/Node2D/Boat/BoatGuy")
	position.x = boat.position.x-randi()%400+200
	position.y = boat.position.y-randi()%400+200
	play("gust")
