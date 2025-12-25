extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var menuItems = ["Inventory", "Save", "Settings", "Quit"]
var menuPointer = 0
var subMenu = "main"

func dig():
	get_node("/root/Node2D/Player/Camera2D/CanvasLayer/Panel").visible = true
	get_node("/root/Node2D/Player/Camera2D/CanvasLayer/Panel").visible = true
	get_node("/root/Node2D/Player/Camera2D/CanvasLayer/Panel/Label").text = "Nothing found."

func quitMenu():
	player.menuMode = false
	visible = false
	subMenu = "main"

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
		if subMenu == "main":
			if menuPointer > menuItems.size() - 1:
				menuPointer = 0
				$Panel/MenuPointer.position.y = 13
		elif subMenu == "inventory":
			if menuPointer > player.inventory.size() - 1:
				menuPointer = 0
				$Panel/MenuPointer.position.y = 13
	
	if Input.is_action_just_pressed("up"):
		menuPointer -= 1
		$Panel/MenuPointer.position.y -= 20
		if menuPointer < 0:
			menuPointer = menuItems.size()-1
			$Panel/MenuPointer.position.y = 13+20*(menuItems.size()-1)
				
	if Input.is_action_just_pressed("menuConfirm"):
		if menuItems[menuPointer] == "Inventory" and subMenu == "main":
			menuDraw(%Player.inventory)
			subMenu = "inventory"
		elif menuItems[menuPointer] == "Quit" and subMenu == "main":
			get_tree().quit()
		elif subMenu == "inventory" and player.inventory[menuPointer] == "Clownfish":
			var label = Label.new()
			label.text = "Clownfish"
			get_node("/root/Node2D").add_child(label)
			label.z_index = 100
			label.global_position = player.global_position
			quitMenu()
		elif subMenu == "inventory" and player.inventory[menuPointer] == "Stick":
			var label = Label.new()
			label.text = "Stick"
			get_node("/root/Node2D").add_child(label)
			label.z_index = 100
			label.global_position = player.global_position
			quitMenu()
		elif subMenu == "inventory" and player.inventory[menuPointer] == "Rock":
			var label = Label.new()
			label.text = "Rock"
			get_node("/root/Node2D").add_child(label)
			label.z_index = 100
			label.global_position = player.global_position
			quitMenu()
		elif subMenu == "inventory" and player.inventory[menuPointer] == "Spade":
			dig()
			quitMenu()
		else:
			quitMenu()
