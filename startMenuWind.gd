extends AnimatedSprite2D

func _physics_process(delta: float) -> void:
		play("gust")

func _on_animation_looped() -> void:
	position.x = randi_range(0, 1280)
	position.y = randi_range(0, 720)
	speed_scale = randf_range(0.8, 1.8)
	scale.x = randf_range(0.05, 0.15)
	scale.y = scale.x
	#rotation = get_node("/root/Node2D/Boat").windDir


func _on_timer_timeout() -> void:
	pass # Replace with function body.
