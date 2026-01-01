extends Area2D

var playerInside = false
@onready var player = get_node("/root/Node2D/Player")
var found = false

func _on_menu_dig() -> void:
	for body in get_overlapping_bodies():
		if body.name == "Player":
			if found == false:
				player.inventory.append("Sword")
				found = true
