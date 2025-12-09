extends StaticBody2D

@onready var player = get_node("/root/Node2D/Player")
@export var ewwDist = 25
@export var nudgeDist = 0.5

func _physics_process (delta):
	if randi() % 1000 > 996:
		if position.y-player.position.y < ewwDist and position.y-player.position.y > -ewwDist:
			if position.x-player.position.x < ewwDist and position.x-player.position.x > 0:
				position.x += nudgeDist
			if position.x-player.position.x > -ewwDist and position.x-player.position.x < 0:
				position.x -= nudgeDist
		if position.x-player.position.x < ewwDist and position.x-player.position.x > -ewwDist:
			if position.y-player.position.y < ewwDist and position.y-player.position.y > 0:
				position.y += nudgeDist
			if position.y-player.position.y > -ewwDist and position.y-player.position.y < 0:
				position.y -= nudgeDist
