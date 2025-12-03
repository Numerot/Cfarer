extends TileMapLayer

func _physics_process(_delta):
	if (randi() % 100) > 94:
		self.position.x += randi() % 4 -2
		self.position.y += randi() % 4 -2
