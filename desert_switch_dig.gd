extends Area2D

@onready var player = get_node("/root/Node2D/Player")
@onready var dialogueBox = get_node("/root/Node2D/Player/Camera2D/DialogueBox")
var found = false
signal itemFound

func _on_menu_dig() -> void:
	for body in get_overlapping_bodies():
		if body.name == "Player":
			if found == false:
				dialogueBox.dialogue("Your spade hit something...")
				#itemFound.emit()
				found = true
				print(dialogueBox.dialogueQueue)
				get_node("/root/Node2D/DesertIsle/TileMapLayer").enabled = false
				get_node("/root/Node2D/DesertIsle/TileMapLayer2").enabled = true
				get_node("/root/Node2D/DesertIsle/TileMapLayer2").visible = true
				get_node("/root/Node2D/DesertIsle/PondWander/PathFollow2D/PondFish").reparent(get_node("/root/Node2D/DesertIsle/ToCenter/PathFollow2D/"))
				get_node("/root/Node2D/DesertIsle/ToCenter/PathFollow2D/PondFish").position.x = 0
				get_node("/root/Node2D/DesertIsle/ToCenter/PathFollow2D/PondFish").position.y = 0
				get_node("/root/Node2D/DesertIsle/ToCenter/PathFollow2D/PondFish").rotation = 0
				get_node("/root/Node2D/DesertIsle/ToCenter/PathFollow2D/").started = true
				
