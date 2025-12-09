extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var menuItems = ["Inventory", "Continue"]
var menuPointer = 1
var subMenu = null

func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		menuPointer +=1
		var menu = get_node("/root/Node2D/Player/Camera2D/Menu")
		$Panel/Sprite2D.position.y += 20

	if Input.is_action_just_pressed("up"):
		menuPointer -= 1
		var menu = get_node("/root/Node2D/Player/Camera2D/Menu")
		$Panel/Sprite2D.position.y -= 20
		
	if Input.is_action_just_pressed("menuConfirm"):
		pass
	if Input.is_action_just_pressed("menuEsc"):
		visible = false
		player.menuMode = false
