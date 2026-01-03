extends Panel

#func _ready() -> void:
	#position.x = get_viewport().size
	#position.y = get_viewport().size

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").dialogueMode == true:
		visible = true
	else:
		visible = false
