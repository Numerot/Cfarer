extends TileMapLayer

var switch = 1
@onready var player = get_node("/root/Node2D/Player")
@onready var boat = get_node("/root/Node2D/Boat")

func _ready() -> void:
	visible = true
	
func _physics_process(delta: float) -> void:
	if Engine.get_physics_frames() % 60 == 0:
		#position.x += randi_range(-5, +5)
		#position.y += randi_range(-5, +5)
		position.x += 5
		position.y += 5
		switch = -switch
	if player.boatMode == true:
		if Engine.get_physics_frames() % 180 == 0:
			global_position.x = boat.global_position.x-10634.0
			global_position.y = boat.global_position.y+2500
	if player.boatMode == false:
		if Engine.get_physics_frames() % 180 == 0:
			global_position.x = player.global_position.x-10634.0
			global_position.y = player.global_position.y+2500
