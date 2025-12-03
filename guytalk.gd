extends StaticBody2D

@export var player_in_range := false

##func _on_Area2D_body_entered(body):
##	if body.name == "Player":
##		player_in_range = true

##func _on_Area2D_body_exited(body):
##	if body.name == "Player":
##		player_in_range = false

func _physics_process(_delta):	
	if Input.is_action_just_pressed("interact") and player_in_range == true:
		var box = get_node("../Player/Camera2D/CanvasLayer")
		box.visible = true
		var label = get_node("../Player/Camera2D/CanvasLayer/Panel/Label")
		label.text = "I'm a guy"
		label.visible = true
		
	if player_in_range == false:
		var label = get_node("../Player/Camera2D/CanvasLayer/Panel/Label")
		label.text = "dialogue"
		label.visible = false
		var box = get_node("../Player/Camera2D/CanvasLayer")
		box.visible = false

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = false
