extends AudioStreamPlayer

@onready var player = get_node("/root/Node2D/Player")
@onready var DesertEntryCheck = get_node("/root/Node2D/DesertIsle/DesertEntryCheck")

func _on_boat_boat_exit() -> void:
	print("boat exited heard")
	print(DesertEntryCheck.playerHere)
	if DesertEntryCheck.playerHere == true:
		print("yass")
		volume_db = -30
		play(0.0)
		print("Now playing 'Desert'.")


func _physics_process(delta: float) -> void:
	if DesertEntryCheck.playerHere == true:
		if volume_db < 0:
			volume_db += 0.2
		if volume_db > 0:
			volume_db = 0

func _on_boat_boat_enter() -> void:
	print("boat entered heard")
	stop()
