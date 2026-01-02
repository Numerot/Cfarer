extends Sprite2D

func _physics_process(delta: float) -> void:
	if randi()%100 > 80:
		position.x += randi_range(-2, 2)
		position.y += randi_range(-2, 2)
	#if randi()%1000 > 990:
		#modulate.a = randf_range(0.23, 0.25)
		#scale.x = (modulate.a/3)*10
		#scale.y = scale.x
	if randi()%1000 > 900:
		rotation += randf_range(-0.02, 0.02)
