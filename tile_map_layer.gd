extends TileMapLayer

func _physics_process(_delta):
	if (randi() % 100) > 95:
		self.position.x += randi() % 7 -3
		self.position.y += randi() % 7 -3
