extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D2
@export var speed = 10
@export var maxSpeed = 100
@onready var CoordLabel: Label = $CoordLabel
@export var boatMode = false

func _physics_process(_delta):
	if not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		_animated_sprite.play("idleDown")
	
	if Input.is_action_pressed("right"):
		velocity.x += speed 
		_animated_sprite.play("runRight")
		$AnimatedSprite2D2.flip_h = false
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		_animated_sprite.play("runRight")
		$AnimatedSprite2D2.flip_h = true
	if Input.is_action_pressed("up"):
		velocity.y -= speed
		_animated_sprite.play("runUp")
	if Input.is_action_pressed("down"):
		velocity.y += speed
		_animated_sprite.play("runDown")
	if Input.is_action_pressed("return"):
		position.x = 0
		position.y = 0
		velocity.x = 0
		velocity.y = 0
		
	if velocity.x >= maxSpeed:
		velocity.x = maxSpeed
	if velocity.x <= -maxSpeed:
		velocity.x = -maxSpeed
	if velocity.y >= maxSpeed:
		velocity.y = maxSpeed
	if velocity.y <= -maxSpeed:
		velocity.y = -maxSpeed
	
	move_and_slide()
	if velocity.x > 0:
		velocity.x -= 1
	if velocity.x < 0:
		velocity.x += 1
	if velocity.y > 0:
		velocity.y -= 1
	if velocity.y < 0:
		velocity.y += 1
	CoordLabel.text = str(position)
