extends Node2D

@export var time = 0
var zoomOut = false

func _physics_process(delta: float):
	time += 1
	if Input.is_action_just_pressed("zoomOut") and zoomOut == false:
		$Player/Camera2D.zoom.x = 0.30
		$Player/Camera2D.zoom.y = 0.30
		$Boat/Camera2D.zoom.x = 0.15
		$Boat/Camera2D.zoom.y = 0.15
		zoomOut = true
	elif Input.is_action_just_pressed("zoomOut") and zoomOut == true:
		$Player/Camera2D.zoom.x = 2.2
		$Player/Camera2D.zoom.y = 2.2
		$Boat/Camera2D.zoom.x = 1.5
		$Boat/Camera2D.zoom.y = 1.5
		zoomOut = false
