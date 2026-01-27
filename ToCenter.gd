extends PathFollow2D
var speed = 0.3
var started = false

func _physics_process(delta: float) -> void:
	if started == true:
		progress += speed
		if Engine.get_physics_frames()% 60 == 0:
			speed = randf_range(0.9, 1.1)
