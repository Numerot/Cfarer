extends PathFollow2D

var speed = 1.5
@onready var player = get_node("/root/Node2D/Player")

#func _ready() -> void:
	#$AnimatedSprite2D.play("default")
	#$AnimatedSprite2D/Shadow.play("default")

func _physics_process(delta: float) -> void:
	if $OrbitBird != null:
		progress += speed
