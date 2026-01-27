extends Label

func _ready() -> void:
	position.y = 10

func _physics_process(delta: float) -> void:
	text = str(int(%Player.position.x))+", "+str(int(%Player.position.y))
