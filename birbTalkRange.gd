extends Area2D

func _unhandled_input(event) -> void:
	if event.is_action_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.name == "Player" and %Player.dialogueMode == false:
				%DialogueBox.dialogue("You should watch the Sopranos! (BIRB becomes your friend!)")				
				%Sounds.playSFX("ItemFound")				
				%OrbitBird.reparent(%BirbPathToInitial/PathFollow2D)
				%OrbitBird.position.x = 0
				%OrbitBird.position.y = 0
				get_viewport().set_input_as_handled()
