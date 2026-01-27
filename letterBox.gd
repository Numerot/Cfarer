extends Panel

func _ready() -> void:
	var viewport = get_viewport()
	size.x = viewport.size.x
	size.y = viewport.size.y/3
	position.x = -viewport.size.x/2
	position.y = -viewport.size.y/2
	rotation = 0

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").dialogueMode == true:
		visible = true
	else:
		visible = false
