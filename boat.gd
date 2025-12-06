extends CharacterBody2D

@export var speed = 0
@export var boatSpeed = 4
@export var maxSpeed = 140
@export var player_in_range_boat := false
@onready var _animated_sprite = $BoatAnimated
@onready var _boatguy = $BoatGuy

func _on_ready():
	var player = get_node("/root/Node2D/Player")
	add_collision_exception_with(player)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range_boat = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range_boat = false

func _physics_process(_delta):	
	if Input.is_action_just_pressed("interact") and player_in_range_boat == true:
		var playerAnim = get_node("../Player/AnimatedSprite2D2")
		playerAnim.visible = false
		var player = get_node("../Player")
		player.speed = 0
		player.boatMode = true
		speed = boatSpeed
		var playerCamera = get_node("../Player/Camera2D")
		playerCamera.enabled = false
		var boatCamera = get_node("../Boat/Camera2D")
		boatCamera.enabled = true
		$Boat.visible = false
		$BoatAnimated.visible = true
		$BoatGuy.visible = true
	
	var player = get_node("../Player")
	if Input.is_action_just_pressed("deboat") and player.boatMode == true:
		var playerAnim = get_node("../Player/AnimatedSprite2D2")
		playerAnim.visible = true
		player.speed = 5
		speed = 0
		var playerCamera = get_node("../Player/Camera2D")
		playerCamera.enabled = true
		var boatCamera = get_node("../Boat/Camera2D")
		boatCamera.enabled = false
		player.position.x = self.position.x
		player.position.y = self.position.y
		velocity.x = 0
		velocity.y = 0
		player.boatMode = false
		$BoatAnimated.visible = false
		$Boat.visible = true
		$BoatGuy.visible = false
	
	if Input.is_action_pressed("right"):
		velocity.x += speed 
		_animated_sprite.play("right")
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		_animated_sprite.play("left")
	if Input.is_action_pressed("up"):
		velocity.y -= speed
		_animated_sprite.play("up")
	if Input.is_action_pressed("down"):
		velocity.y += speed
		_animated_sprite.play("down")
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
	#if velocity.x > 0:
		#velocity.x -= 1
	#if velocity.x < 0:
		#velocity.x += 1
	#if velocity.y > 0:
		#velocity.y -= 1
	#if velocity.y < 0:
		#velocity.y += 1
