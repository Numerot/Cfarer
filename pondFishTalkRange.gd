extends Area2D

@onready var pondFish = %PondFish
@onready var pathToInitial = %PondFishToInitialFollow

func _unhandled_input(event) -> void:
	if event.is_action_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.name == "Player" and %Player.dialogueMode == false:
				%DialogueBox.dialogue("yes hello")
				pondFish.rotation = 0
				pondFish.reparent(pathToInitial)
				get_viewport().set_input_as_handled()
				pondFish.position.x = 0
				pondFish.position.y = 0
