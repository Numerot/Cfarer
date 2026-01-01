extends Area2D

var playerHere = false

func _physics_process(float)->void:
	for body in get_overlapping_bodies():
		if body.name == "Boat":
			playerHere = true
