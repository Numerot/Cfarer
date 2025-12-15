extends AnimatedSprite2D

var past = false
var speed = randi()%20
@onready var boat = get_node("/root/Node2D/Boat")

func _physics_process(delta: float) -> void: 
	if global_position.x >= boat.global_position.x+1000:
		visible = false
		past = true
	if visible == false and past == false and get_node("/root/Node2D/Player").boatMode == true and randi()%2000 > 1998:
		visible = true
		position.y += randi()%700-350
		play("default")
		scale.x = randf_range(0.5, 0.8)
		scale.y = scale.x
	if visible == true:
		position.x += 5+speed
		if randi()%100 > 90:
			position.y += randi()%5-2
	if get_node("/root/Node2D/Player").boatMode == false:
		visible = false
	if past == true:
		global_position.x = boat.global_position.x - 1000
		past = false
