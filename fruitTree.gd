extends Area2D

var found = false
@onready var player = get_node("/root/Node2D/Player")
@onready var dialogueBox = get_node("/root/Node2D/Player/Camera2D/DialogueBox")
signal itemFound

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):	
		for body in get_overlapping_bodies():
			if body.name == "Player":
				if found == false:
					player.inventory.append("Fruit")
					dialogueBox.dialogue("Got FRUIT!")
					#itemFound.emit()
					%Sounds.playSFX("ItemFound")
					found = true
