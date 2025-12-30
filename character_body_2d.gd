extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D2
@export var speed = 15
@export var maxSpeed = 100
@export var boatMode = false
@export var menuMode = false
@export var inventory = ["Stick", "Rock", "Spade"]
signal menuStart

func _physics_process(_delta):
	#if boatMode == true:
		#$Sprite2D.visible = false
	#if boatMode == false:
		#$Sprite2D.visible = true
	if Input.is_action_just_pressed("menu"):
		if menuMode == false:
			menuMode = true
			menuStart.emit()
		elif menuMode == true:
			menuMode = false
			$Camera2D/Menu.visible = false
	if not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		_animated_sprite.play("idleDown")
		velocity.x = 0
		velocity.y = 0
	if menuMode == false:
		if Input.is_action_pressed("right"):
			velocity.x += speed
		if Input.is_action_pressed("left"):
			velocity.x -= speed
		if Input.is_action_pressed("up"):
			velocity.y -= speed
		if Input.is_action_pressed("down"):
			velocity.y += speed

		if Input.is_action_just_pressed("right"):
			_animated_sprite.play("runRight")
			$AnimatedSprite2D2.flip_h = false
		if Input.is_action_just_pressed("left"):
			_animated_sprite.play("runRight")
			$AnimatedSprite2D2.flip_h = true
		if Input.is_action_just_pressed("up"):
			_animated_sprite.play("runUp")
		if Input.is_action_just_pressed("down"):
			_animated_sprite.play("runDown")

		if Input.is_action_pressed("speedUp"):
			maxSpeed = maxSpeed*1.1
		if Input.is_action_pressed("speedDown"):
			maxSpeed = maxSpeed/1.1

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

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("LagoonHouse.tscn")
		#LagoonHouse.add_child(self)
