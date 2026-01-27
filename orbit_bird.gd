extends AnimatedSprite2D
@onready var pathToIsle = get_node("/root/Node2D/WanderingIsle/Path2D/PathFollow2D/BirdToIsle/PathFollow2D")

func _on_bird_check_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		reparent(pathToIsle)
		print("Reparented?")
		$Shadow.position.y -= 50
