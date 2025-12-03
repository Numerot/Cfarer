extends AnimatedSprite2D
@onready var _animated_sprite = $AnimatedTree

func _physics_process(_delta):
	_animated_sprite.play("default")
