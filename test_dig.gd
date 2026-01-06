extends Area2D

@onready var player = get_node("/root/Node2D/Player")
@onready var dialogueBox = get_node("/root/Node2D/Player/Camera2D/DialogueBox")
var found = false
signal itemFound


func _on_menu_dig() -> void:
	for body in get_overlapping_bodies():
		if body.name == "Player":
			if found == false:
				#player.inventory.append("Sword")
				dialogueBox.dialogue("Found NOTHING AT ALL! Wow! What a waste of time! I'm going to include plenty of text here to test if text justification actually works! Amazing!")
				%Sounds.playSFX("ItemFound")
				#itemFound.emit()
				#found = true
				print(dialogueBox.dialogueQueue)
