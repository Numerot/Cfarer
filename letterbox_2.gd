extends Panel

#func _ready() -> void:
	#position.x = get_viewport().size.x/3*2
	#position.y = -500

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").dialogueMode == true:
		visible = true
	else:
		visible = false
