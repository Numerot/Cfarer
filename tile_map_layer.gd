extends TileMapLayer
@onready var boat = get_node("/root/Node2D/Boat")
var switch = 1

func _physics_process(_delta):
	#if (randi() % 100) > 95:
		#self.position.x += randi() % 7 -3
		#self.position.y += randi() % 7 -3

	if Engine.get_physics_frames() % 60-boat.windSpeed*2 == 0:
		#position.x += randi_range(-5, +5)
		#position.y += randi_range(-5, +5)
		position.x += (2+boat.windSpeed/3)*switch
		position.y += (2+boat.windSpeed/3)*switch
		switch = -switch
