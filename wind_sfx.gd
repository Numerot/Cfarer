extends AudioStreamPlayer

func _ready():
	play()

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").boatMode == true and volume_db < -25+1.5*get_node("/root/Node2D/Boat").windSpeed:
		volume_db += 0.1
	if get_node("/root/Node2D/Player").boatMode == true and volume_db > -25+1.5*get_node("/root/Node2D/Boat").windSpeed:
		volume_db -= 0.1

	if get_node("/root/Node2D/Player").boatMode == false and volume_db > -30:
		volume_db -= 0.1
	if get_node("/root/Node2D/Player").boatMode == false and volume_db < -30:
		volume_db += 0.1
	
	if volume_db > 0:
		volume_db = 0
