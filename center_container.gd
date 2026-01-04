extends CenterContainer

func _ready() -> void:
	size.x = get_viewport_rect().size.x
	size.y = get_viewport_rect().size.y
	#position.x = 1280/2
	#position.y = 720/2
