extends PathFollow2D
var speed = 0.3

func _physics_process(delta: float) -> void:
	progress += speed
	if Engine.get_physics_frames()% 120 == 0:
		speed = randf_range(0.5, 1.0)
