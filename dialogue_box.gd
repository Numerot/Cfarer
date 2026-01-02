extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var dialogueQueue = []

func _ready() -> void:
	$Panel.position.x = get_viewport().size.x/2-$Panel.size.x/2
	$Panel.position.y = get_viewport().size.y/3*2-$Panel.size.y/2

func dialogue(dialogue):
	visible = true
	player.dialogueMode = true
	#dialogueQueue.append(dialogue)
	if dialogue is Array:
		dialogueQueue.append_array(dialogue)
	else:
		dialogueQueue.append(dialogue)
	$Panel/Label.text = dialogueQueue[0]
	if dialogueQueue.size() == 1:
		dialogueQueue.pop_front()

func _physics_process(delta: float) -> void:
	if player.dialogueMode == true:
		if Input.is_action_just_pressed("interact"):
			print(dialogueQueue)
			if dialogueQueue.size() == 0:
				player.dialogueMode = false
				visible = false
			elif dialogueQueue.size() == 1:
				$Panel/Label.text = dialogueQueue[0]
				if dialogueQueue[0] == "Got FRIENDSHIP OF BIRDS!":
					player.inventory.append("Friendship of Birds")
					get_node("/root/Node2D/CreepingTreesIsle/Crow").itemFound.emit()
				dialogueQueue.pop_front()
				#player.dialogueMode = false
				#visible = false
			elif dialogueQueue.size() >= 1:
				$Panel/Label.text = dialogueQueue[0]
				dialogueQueue.pop_front()
