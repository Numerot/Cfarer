extends Area2D
@onready var dialogueBox = get_node("/root/Node2D/Player/Camera2D/DialogueBox/")
signal krakenTalk

func _on_menu_seafoam() -> void:
	print("Used Seafoam jewel.")
	for body in get_overlapping_bodies():
		print(get_overlapping_bodies())
		if body.name == "Boat":
			dialogueBox.dialogue("Here goes the dialogue where the kraken admits destroying Desert Isle. Fun!")
			krakenTalk.emit()
