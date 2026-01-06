extends AudioStreamPlayer

@onready var player = get_node("/root/Node2D/Player")
@onready var WanderingEntryCheck = get_node("/root/Node2D/WanderingIsle/Path2D/PathFollow2D/WanderingIsle/WanderingEntryCheck")

func _on_boat_boat_exit() -> void:
	if WanderingEntryCheck.playerHere == true:
		volume_db = -30
		play(0.0)
		print("Now playing 'Far Isle'.")

func _physics_process(delta: float) -> void:
	if WanderingEntryCheck.playerHere == true:
		if volume_db < 0:
			volume_db += 0.2
		if volume_db > 0:
			volume_db = 0

func _on_boat_boat_enter() -> void:
	stop()
