extends CharacterBody2D

@onready var player = get_node("/root/Node2D/Player")
signal itemFound
var myDialogue = ["BIRD: Welcome to my island. I like to call it BIRDHAUS.", "MR. BIRD: Did the dialogue box open blank at first? If so... It's a bug!.", "Got FRIENDSHIP OF BIRDS!"]

func _input(event):
	if event.is_action_pressed("interact"):
		if float($AnimatedSprite2D.global_position.distance_to(player.global_position)) < 20.0 and player.dialogueMode == false:
			get_node("/root/Node2D/Player/Camera2D/DialogueBox").dialogue(myDialogue)
			#get_node("/root/Node2D/Player/Camera2D/DialogueBox").dialogue("MR. BIRD: Did the dialogue box open blank at first? If so... It's a bug!.")
			myDialogue.pop_back()
			
func _physics_process(delta):
		if (randi() % 300) > 298:
			$AnimatedSprite2D.play("idle")
		if (randi() % 100) > 97:
			self.position.x -= randi() % 2 - 1
		if (randi() % 100) > 97:
			self.position.y -= randi() % 2 - 1
		#if Input.is_action_just_pressed("interact") and float($AnimatedSprite2D.global_position.distance_to(player.global_position)) < 20.0 and player.dialogueMode == false:
			#get_node("/root/Node2D/Player/Camera2D/DialogueBox").dialogue("BIRD: Welcome to my island. I like to call it BIRDHAUS.")
			#get_node("/root/Node2D/Player/Camera2D/DialogueBox").dialogue("MR. BIRD: Did the dialogue box open blank at first? If so... It's a bug!.")
