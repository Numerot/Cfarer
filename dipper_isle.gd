extends TileMapLayer

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D").dayNight == "Night":
		visible = true
		collision_enabled = true
		$BoatStuff/DeBoat/CollisionShape2D.disabled = false
		$BoatStuff/PlayerLimit/CollisionPolygon2D.disabled = false
		$BoatStuff/BoatLimit/CollisionPolygon2D.disabled = false

	if get_node("/root/Node2D").dayNight == "Day":
		visible = false
		$BoatStuff/DeBoat/CollisionShape2D.disabled = true
		$BoatStuff/PlayerLimit/CollisionPolygon2D.disabled = true
		$BoatStuff/BoatLimit/CollisionPolygon2D.disabled = true
		collision_enabled = false
