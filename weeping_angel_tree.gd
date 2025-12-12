extends StaticBody2D

var everSeen = false
var onScreen = false
var movedYet = false

# NOTE: currently only ONE of the trees works(/"works"), probably something to do with
# it being named WeepingAngelTree and not WeepingAngelTree[X] or with 
# movedYet or something, idk. Nothing's stopping them from jumping into the sea,
# either.
# 

func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.name == "WeepingAngelTree":
	if body.get_parent().name == "WeepingAngelTrees":
		everSeen = true
		onScreen = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	#if body.name == "WeepingAngelTree":
	if body.get_parent().name == "WeepingAngelTrees":
		onScreen = false
		movedYet = false

func _physics_process(delta: float) -> void:
	if everSeen == true and onScreen == false and movedYet == false:
		position.x += randi() % 3 - 1
		position.y += randi() % 3 - 1
		#movedYet = true
