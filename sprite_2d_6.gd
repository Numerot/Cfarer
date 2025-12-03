extends Sprite2D

func _physics_process(_delta):
	if (randi() % 100) > 98:
		self.position.x += randi() % 4 -2
		self.position.y += randi() % 4 -2
