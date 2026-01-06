extends PathFollow2D

var speed = 1.5
var storedPosition
@onready var player = get_node("/root/Node2D/Player")

func _physics_process(delta: float) -> void:
	progress += speed
	#if storedPosition == null:
		#storedPosition = global_position
	#if $WanderingIsle/WanderingEntryCheck.playerHere and player.boatMode == false:
		#player.global_position += global_position-storedPosition
		#storedPosition = global_position
