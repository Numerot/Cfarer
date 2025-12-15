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
	position.x = boat.position.x-randi()%800+400
	position.y = boat.position.y-randi()%600+300
	speed_scale = (randi()%100+80)/100.0
	scale.x = (randi()%100+50)/1000.0
	scale.y = scale.x
	rotation = get_node("/root/Node2D/Boat").windDir
