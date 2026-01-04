extends Label

#func _physics_process(delta: float) -> void:
	#if Engine.get_physics_frames() % 90 == 0:
		#position.x = randi_range(120, 1150)
		#position.y = randi_range(70, 650)
