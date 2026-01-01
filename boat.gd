extends CharacterBody2D

@export var speed = 0
@export var boatSpeed = 1.5
@export var maxSpeed = 1000
@export var player_in_range_boat := false
@export var canDeBoat = false
@onready var _animated_sprite = $BoatAnimated
@onready var _boatguy = $BoatGuy
var drag = 0.00001
var windDir = randi()%100
var windSpeed = 10
var positionStore
@export var windMin = 0
@export var windMax = 13
signal boatEnter
signal boatExit
var anchored = false
var sailUp = false
var windMultiplier = 1

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
	var player = get_node("../Player")
	if Input.is_action_just_pressed("interact") and player.boatMode == false and player_in_range_boat == true:
		var playerAnim = get_node("../Player/AnimatedSprite2D2")
		playerAnim.visible = false
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
		$Camera2D/WindDirPointer.visible = true
		$Camera2D/WindDirLabel.visible = true
		get_node("/root/Node2D/Player/Camera2D/NightFilter").visible = false
		if get_node("/root/Node2D").dayNight == "Night":
			get_node("/root/Node2D/Boat/Camera2D/NightFilter").visible = true
		get_node("/root/Node2D/Player/Camera2D/NightFilter").visible = false
		get_node("/root/Node2D/Player/Camera2D/TimeLabel").visible = false
		get_node("/root/Node2D/Boat/Camera2D/TimeLabel").visible = true
		get_node("/root/Node2D/Player/PlayerCollision").disabled = true
		boatEnter.emit()

	elif Input.is_action_just_pressed("interact") and player.boatMode == true and canDeBoat == true:
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
		$Camera2D/WindDirPointer.visible = false
		$Camera2D/WindDirLabel.visible = false
		get_node("/root/Node2D/Player/PlayerCollision").disabled = false
		get_node("/root/Node2D/Boat/Camera2D/NightFilter").visible = false
		if get_node("/root/Node2D").dayNight == "Night":
			get_node("/root/Node2D/Player/Camera2D/NightFilter").visible = true
		get_node("/root/Node2D/Player/Camera2D/TimeLabel").visible = true
		get_node("/root/Node2D/Boat/Camera2D/TimeLabel").visible = false
		boatExit.emit()
	
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
		
	if Input.is_action_pressed("speedUp"):
			maxSpeed = maxSpeed*1.1
	if Input.is_action_pressed("speedDown"):
			maxSpeed = maxSpeed/1.1

	windDir += randf_range(-0.04, +0.04)
	if randi()%100 > 96: 
		windSpeed += randi()%3-1
	if windSpeed < windMin:
		windSpeed = windMin
	if windSpeed > windMax:
			windSpeed = windMax
	get_node("/root/Node2D/Boat/Camera2D/WindDirLabel").text = str(windSpeed)
	
	if sailUp == true:
		windMultiplier = 3
	else:
		windMultiplier = 1

	if %Player.boatMode == true:
		velocity.x += cos(windDir) * windMultiplier*windSpeed/10
		velocity.y += sin(windDir) * windMultiplier*windSpeed/10
		
	velocity.x = velocity.x-(drag*velocity.x*abs(velocity.x))
	velocity.y = velocity.y-(drag*velocity.y*abs(velocity.y))
	
	if anchored == false:
		move_and_slide()
	if position == positionStore:
		velocity.x = 0
		velocity.y = 0
	positionStore = position

func _on_de_boat_body_entered(body: Node2D) -> void:
	if body.name == "Boat":
		canDeBoat = true

func _on_de_boat_body_exited(body: Node2D) -> void:
	if body.name == "Boat":
		canDeBoat = false
