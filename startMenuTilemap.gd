extends TileMapLayer
var switch = 1

func _physics_process(delta: float) -> void:
	if Engine.get_physics_frames() % 60 == 0:
		position.x += 8*switch
		position.y += 8*switch
		switch = -switch
