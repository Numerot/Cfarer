extends Node2D

@export var time = 0
@export var hour = 0
@export var day = 1
@export var dayNight = "Day"
var zoomOut = false
signal nightfall
signal sunrise
var hourLength = 720
var dayLength = 12

func _physics_process(delta: float):
	if Input.is_action_just_pressed("zoomOut") and zoomOut == false:
		$Player/Camera2D.zoom.x = 0.30
		$Player/Camera2D.zoom.y = 0.30
		$Boat/Camera2D.zoom.x = 0.15
		$Boat/Camera2D.zoom.y = 0.15
		zoomOut = true
	elif Input.is_action_just_pressed("zoomOut") and zoomOut == true:
		$Player/Camera2D.zoom.x = 2
		$Player/Camera2D.zoom.y = 2
		$Boat/Camera2D.zoom.x = 1.5
		$Boat/Camera2D.zoom.y = 1.5
		zoomOut = false

	time += 1
	if time >= hourLength:
		hour += 1
		if hour >= dayLength/2:
				dayNight = "Night"
				if get_node("/root/Node2D/Player").boatMode == false:
					get_node("/root/Node2D/Player/Camera2D/NightFilter").visible = true
				if get_node("/root/Node2D/Player").boatMode == true:
					get_node("/root/Node2D/Boat/Camera2D/NightFilter").visible = true
		time = 0
		get_node("/root/Node2D/Player/Camera2D/TimeLabel").text = "Hour"+str(hour)+dayNight+str(day)
		get_node("/root/Node2D/Boat/Camera2D/TimeLabel").text = "Hour"+str(hour)+dayNight+str(day)

	if hour >= dayLength:
		hour = 0
		dayNight = "Day"
		get_node("/root/Node2D/Player/Camera2D/NightFilter").visible = false
		get_node("/root/Node2D/Boat/Camera2D/NightFilter").visible = false
		day += 1	
		get_node("/root/Node2D/Player/Camera2D/TimeLabel").text = "Hour"+str(hour)+dayNight+str(day)
		get_node("/root/Node2D/Boat/Camera2D/TimeLabel").text = "Hour"+str(hour)+dayNight+str(day)
