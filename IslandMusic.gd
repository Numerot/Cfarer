extends AudioStreamPlayer
#
#@onready var player = get_node("/root/Node2D/Player")
#@onready var InitialEntryCheck = get_node("/root/Node2D/InitialIsland/InitialEntryCheck")
#
#func _on_boat_boat_exit() -> void:
	#if InitialEntryCheck.playerHere == true:
		#volume_db = -30
		#play(0.0)
		#print("Now playing 'Island'.")
#
#
#func _physics_process(delta: float) -> void:
	#if InitialEntryCheck.playerHere == true:
		#if volume_db < 0:
			#volume_db += 0.2
		#if volume_db > 0:
			#volume_db = 0
#
#func _on_boat_boat_enter() -> void:
	#stop()
