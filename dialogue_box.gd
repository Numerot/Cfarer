extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var dialogueQueue = []

func dialogue(dialogue):
	$Panel.size.x = 500
	$Panel.size.y = 200
	$Panel.position.x = get_viewport().size.x/2-$Panel.size.x/2
	$Panel.position.y = get_viewport().size.y/3*2
	$Panel.visible = true
	visible = true
	player.dialogueMode = true
	if dialogue is Array:
		dialogueQueue.append_array(dialogue)
	else:
		dialogueQueue.append(dialogue)
	$Panel/Label.text = dialogueQueue[0]
	if dialogueQueue.size() == 1:
		dialogueQueue.pop_front()
		
func _unhandled_input(event) -> void:
	if event.is_action_pressed("interact"):
		print("	DialogueBox: heard interact!")
		if player.dialogueMode == true:
			print(dialogueQueue)
			dialogueQueue.pop_front()
			if dialogueQueue.size() > 0:
				$Panel/Label.text = dialogueQueue[0]
				if dialogueQueue[0] == "Got FRIENDSHIP OF BIRDS!":
					player.inventory.append("Friendship of Birds")
					get_node("/root/Node2D/CreepingTreesIsle/Crow").itemFound.emit()
			else:
				player.dialogueMode = false
				visible = false

			get_viewport().set_input_as_handled()
