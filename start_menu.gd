extends Node2D

var simultaneous_scene = preload("res://node_2D.tscn").instantiate()

func _input(event):
	if event.is_action_pressed("menuConfirm"):
		get_tree().root.add_child(simultaneous_scene)
