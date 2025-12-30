extends StaticBody2D

var everSeen = false
var onScreen = false
var movedYet = true
@onready var player = get_node("/root/Node2D/Player")

# NOTE: currently only ONE of the trees works(/"works"), probably something to do with
# it being named WeepingAngelTree and not WeepingAngelTree[X] or with 
# movedYet or something, idk. Nothing's stopping them from jumping into the sea,
# either.
# 

#func _on_area_2d_body_entered(body: Node2D) -> void:
	##if body.name == "WeepingAngelTree":
	#if body.get_parent().name == "WeepingAngelTrees":
		#everSeen = true
		#onScreen = true
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	##if body.name == "WeepingAngelTree":
	#if body.get_parent().name == "WeepingAngelTrees":
		#onScreen = false
		#movedYet = false

func _physics_process(delta: float) -> void:
	if float(global_position.distance_to(player.global_position)) < 200.0:
		everSeen = true
	if everSeen == true and movedYet == false and float(global_position.distance_to(player.global_position)) > 450.0:
			position.x += randi() % 41 - 20
			position.y += randi() % 41 - 20
			movedYet = true
	if float(global_position.distance_to(player.global_position)) < 360:
		movedYet = false
