extends AudioStreamPlayer

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").boatMode == true and self.volume_db < -20:
		self.volume_db += 0.4
	if get_node("/root/Node2D/Player").boatMode == false and self.volume_db > -35:
		self.volume_db -= 0.4
