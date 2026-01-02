extends AudioStreamPlayer

func _on_boat_boat_enter() -> void:
	play(0.0)
	volume_db = -200
	print("Now playing 'Sailing'.")


func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").boatMode == true:
		volume_db = -5+1.5*get_node("/root/Node2D/Boat").windSpeed
		if volume_db > 0:
			volume_db = 0
	if get_node("/root/Node2D/Player").boatMode == false:
		volume_db -= 0.3

#func _on_boat_boat_exit() -> void:
	#stop()
	#print("Stop sailing music")
	#volume_db = -50
