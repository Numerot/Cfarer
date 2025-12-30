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
#@export var ownVelocityX = 0
#@export var ownVelocityY = 0
@export var windVelocityX = 0
@export var windVelocityY = 0
var positionStore
@export var windMin = 0
@export var windMax = 13
signal boatEnter
signal boatExit

func _on_ready():
	var player = get_node("/root/Node2D/Player")
	add_collision_exception_with(player)

# This works right now, but I have NO IDEA if it's even remotely sustainable
# or it this shouldn't be done otherwise. This is currently checking for if 
# 1: Player has entered the boat entry zone, and if 2: Boat has entered the
# deBoat zones. Why doesn't this create a separate function for each signal
# instance? Seems very strange, maybe the signal has it baked in that "body"
# can only refer to one of the two parties of the signal, but I think this also
# fires if ANY body enters the area (thus body.name == Player/Boat).

# EDIT: Doesn't work.

# EDIT: I think the problem is it's not correctly detecting the signal's sender
# 		and/or the signals are setup incorrectly on the backend.

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range_boat = true
	#if body.name == "Boat" and get_current_signal_sender().name == "DeBoat":
		#canDeBoat = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range_boat = false
	if body.name == "DeBoat":
		canDeBoat = false

func _physics_process(_delta):	
	var player = get_node("../Player")
	if Input.is_action_just_pressed("interact") and player_in_range_boat == true:
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
		boatEnter.emit()

#		add "and canDeBoat = true" to the elif below when you've fixed the POS
	elif Input.is_action_just_pressed("interact") and player.boatMode == true:
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
		
	if %Player.boatMode == true:
		velocity.x += cos(windDir) * windSpeed/100
		velocity.y += sin(windDir) * windSpeed/10
		
	velocity.x = velocity.x-(drag*velocity.x*abs(velocity.x))
	velocity.y = velocity.y-(drag*velocity.y*abs(velocity.y))
	
	move_and_slide()
	if position == positionStore:
		velocity.x = 0
		velocity.y = 0
	positionStore = position

func _on_de_boat_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
