extends AudioStreamPlayer

#@onready var player = get_node("/root/Node2D/Player")
#@onready var FarEntryCheck = get_node("/root/Node2D/FarIsle/FarEntryCheck")
#
#func _on_boat_boat_exit() -> void:
	#if FarEntryCheck.playerHere == true:
		#volume_db = -30
		#play(0.0)
		#print("Now playing 'Far Isle'.")
#
#func _physics_process(delta: float) -> void:
	#if FarEntryCheck.playerHere == true:
		#if volume_db < 0:
			#volume_db += 0.2
		#if volume_db > 0:
			#volume_db = 0
#
#func _on_boat_boat_enter() -> void:
	#stop()
