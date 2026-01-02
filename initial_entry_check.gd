extends Area2D
var playerHere = false
var playerFound = false

func _physics_process(delta: float)->void:
	for body in get_overlapping_bodies():
		if body.name == "Boat":
			playerFound = true
	if playerFound == true:
		playerHere = true
	if playerFound == false:
		playerHere = false
	playerFound = false
	if Engine.get_physics_frames() % 300 == 0:
		print("     on Initial Trees Isle:     "+str(playerHere))
