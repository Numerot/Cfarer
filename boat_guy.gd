extends AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		play("down")
	if Input.is_action_just_pressed("right"):
		play("right")
	if Input.is_action_just_pressed("left"):
		play("left")
	if Input.is_action_just_pressed("up"):
		play("up")
