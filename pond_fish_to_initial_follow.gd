extends PathFollow2D
var speed = 0.3

func _physics_process(delta: float) -> void:
	progress += speed
	if $PondFish != null:
		if Engine.get_physics_frames()% 120 == 0:
			speed = randf_range(0.5, 1.0)
		if $PondFish.position.x > 0:
			$PondFish.position.x -= 0.1
		if $PondFish.position.x < 0:
			$PondFish.position.x += 0.1
		if $PondFish.position.y > 0:
			$PondFish.position.y -= 0.1
		if $PondFish.position.y < 0:
			$PondFish.position.y += 0.1
