extends Label

func _ready() -> void:
	position.x = get_viewport_rect().size.x/2
	position.y = get_viewport_rect().size.y/2
	#position.x = 1280/2
	#position.y = 720/2
