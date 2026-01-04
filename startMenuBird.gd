extends AnimatedSprite2D

var speed = randi_range(7, 20)
var go = false

func _ready() -> void:
	visible = false

func _physics_process(delta: float) -> void: 
	if go == true and randi()%2000 > 1958 and position.x > 2000:
		position.x = -25
		position.y += randi()%700-350
		play("default")
		scale.x = randf_range(0.5, 1.3)
		scale.y = scale.x
	if visible == true:
		position.x += 5+speed
		if randi()%100 > 90:
			position.y += randi()%5-2

func _on_timer_timeout() -> void:
	go = true 
	visible = true
