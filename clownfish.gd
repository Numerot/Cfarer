extends StaticBody2D
@onready var player = get_node("/root/Node2D/Player")

func _ready():
	print(player, player.global_position)
	print(self, self.global_position)

func _physics_process (delta):
	if Input.is_action_just_pressed("interact") and float($Sprite2D.global_position.distance_to(player.global_position)) < 20.0:
			player.inventory.push_back("Clownfish")
			queue_free()
	
