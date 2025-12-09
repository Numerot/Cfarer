extends StaticBody2D

var everSeen = false
var onScreen = false
var movedYet = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.name == "WeepingAngelTree":
	if body.get_parent().name == "WeepingAngelTrees":
		everSeen = true
		onScreen = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	#if body.name == "WeepingAngelTree":
	if body.get_parent().name == "WeepingAngelTrees":
		onScreen = false
		movedYet = false

func _physics_process(delta: float) -> void:
	if everSeen == true and onScreen == false and movedYet == false:
		position.x += randi() % 3 - 1
		position.y += randi() % 3 - 1
		#movedYet = true
