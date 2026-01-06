extends Area2D

func _unhandled_key_input(event) -> void:
	if event.is_action_pressed("interact"):
		#if Input.is_action_just_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.name == "Player":
				%DialogueBox.dialogue("...hey...")
			#Viewport.instantiate()
			#Viewport.set_input_as_handled()
