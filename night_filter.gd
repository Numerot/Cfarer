extends Panel

func _ready() -> void:
	var viewport = get_viewport()
	#size.x = viewport.size.x*2
	#size.y = viewport.size.y*2

	size.x = 10000
	size.y = 10000
	position.x = -5000
	position.y = -5000
