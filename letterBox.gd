extends Panel
#
#func _ready() -> void:
	#global_position.y = get_viewport().position.y

func _physics_process(delta: float) -> void:
	if get_node("/root/Node2D/Player").dialogueMode == true:
		visible = true
	else:
		visible = false
