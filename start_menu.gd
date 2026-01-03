extends Node2D

var gameScene = preload("res://node_2D.tscn").instantiate()

func _input(event):
	if event.is_action_pressed("menuConfirm"):
		get_tree().change_scene_to_file("res://node_2D.tscn")
		
		#get_tree().root.add_child(simultaneous_scene)

			#get_node("/root/Node2D/Sounds/IslandMusic").volume_db = -90
			#get_node("/root/Node2D/Sounds/CreepingTree").volume_db = -90
