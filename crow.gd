extends CharacterBody2D

func _physics_process(delta):
		if (randi() % 300) > 298:
			$AnimatedSprite2D.play("idle")
		if (randi() % 100) > 97:
			self.position.x -= randi() % 2 - 1
		if (randi() % 100) > 97:
			self.position.y -= randi() % 2 - 1
