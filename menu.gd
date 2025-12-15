extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var menuItems = ["Inventory", "asd", "Save", "Settings"]
var menuPointer = 0
var subMenu = null

func menuDraw(arrayToDraw):
	var ticker = 1
	for i in range(0, 20):
		var nodeName = str(i)
		var node = $Panel.get_node(nodeName)
		if node != null:
			node.queue_free()
	for i in arrayToDraw:
		var menuItem = Label.new()
		menuItem.position.x = 0
		menuItem.position.y = -20+ticker*20
		$Panel.add_child(menuItem)
		menuItem.text = i
		menuItem.name = str(ticker)
		ticker += 1

func _on_player_menu_start() -> void:
	self.visible = true
	menuDraw(menuItems)
	menuPointer = 0
	$Panel/MenuPointer.position.y = 13

func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		menuPointer += 1
		$Panel/MenuPointer.position.y += 20
		if menuPointer > menuItems.size() - 1:
			menuPointer = 0
			$Panel/MenuPointer.position.y = 13
		print(menuPointer)
	
	if Input.is_action_just_pressed("up"):
		menuPointer -= 1
		$Panel/MenuPointer.position.y -= 20
		if menuPointer < 0:
			menuPointer = menuItems.size()-1
			$Panel/MenuPointer.position.y = 13+20*(menuItems.size()-1)
		print(menuPointer)
				
	if Input.is_action_just_pressed("menuConfirm"):
		if menuItems[menuPointer] == "Inventory":
			menuDraw(%Player.inventory)
			subMenu = "inventory"
