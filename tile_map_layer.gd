extends TileMapLayer

func _physics_process(_delta):
	if (randi() % 100) > 95:
		self.position.x += randi() % 3 -1
		self.position.y += randi() % 3 -1
