extends AudioStreamPlayer
@onready var CreepingEntryCheck = get_node("/root/Node2D/CreepingTreesIsle/CreepingEntryCheck")

func _ready():
	volume_db = -10

#func _on_boat_boat_enter() -> void:
	#stop()
	#volume_db = -50

func _on_boat_boat_exit() -> void:
	if CreepingEntryCheck.playerHere == false:
	#volume_db = -25
		play(0.0)

func _physics_process(delta: float) -> void:
	if CreepingEntryCheck.playerHere == false:
		if get_node("/root/Node2D/Player").boatMode == false and volume_db < -5:
			volume_db += 0.3
			if volume_db > 0:
				volume_db = 0
		if get_node("/root/Node2D/Player").boatMode == true and volume_db > -200:
			volume_db -= 0.2
