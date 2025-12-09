extends AnimatedSprite2D

func _physics_process(delta):
		if (randi() % 300) > 298:
			play("idle")
		if (randi() % 100) > 97:
			var change = randi() % 5 - 2
			position.x -= change
			get_node("../CollisionShape2D").position.x -= change
		if (randi() % 100) > 97:
			var change = randi() % 5 - 2
			position.y -= change
			get_node("../CollisionShape2D").position.y -= change
