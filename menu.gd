extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
@onready var boat = get_node("/root/Node2D/Boat")
var menuItems = ["Inventory", "Save", "Settings", "Quit"]
var menuPointer = 0
var subMenu = "main"
@onready var dialogueBox = get_node("/root/Node2D/Player/Camera2D/DialogueBox")
var inRangeOfDig = false
signal dig
signal dredge

#func dig():
	#player.dialogueMode = true
	#get_node("/root/Node2D/Player/Camera2D/DialogueBox/Panel").visible = true
	#dialogueBox.visible = true
	#if inRangeOfDig == false:
		#dialogueBox.dialogueQueue.append("Nothing found.")
	
func anchorToggle():
	if player.boatMode == true:
		boat.anchored = not boat.anchored
		
func sailToggle():
	if player.boatMode == true:
		boat.sailUp = not boat.sailUp

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
			# yeah this solution sucks
			if subMenu == "main":
				menuPointer = menuItems.size()-1
				$Panel/MenuPointer.position.y = 13+20*(menuItems.size()-1)
			if subMenu == "inventory":
				menuPointer = player.inventory.size()-1
				$Panel/MenuPointer.position.y = 13+20*(player.inventory.size()-1)

	if Input.is_action_just_pressed("menuConfirm"):
		if player.menuMode == true:
			if subMenu == "main":
				if menuItems[menuPointer] == "Inventory":
					menuDraw(%Player.inventory)
					subMenu = "inventory"
				elif menuItems[menuPointer] == "Quit":
					get_tree().quit()
			elif subMenu == "inventory":
				if player.inventory[menuPointer] == "Clownfish":
					var label = Label.new()
					label.text = "Clownfish"
					get_node("/root/Node2D").add_child(label)
					label.z_index = 100
					label.global_position = player.global_position
					quitMenu()
				if player.inventory[menuPointer] == "Stick":
					var label = Label.new()
					label.text = "Stick"
					get_node("/root/Node2D").add_child(label)
					label.z_index = 100
					label.global_position = player.global_position
					quitMenu()
				if player.inventory[menuPointer] == "Rock":
					var label = Label.new()
					label.text = "Rock"
					get_node("/root/Node2D").add_child(label)
					label.z_index = 100
					label.global_position = player.global_position
					quitMenu()
				if player.inventory[menuPointer] == "Spade":
					dig.emit()
					quitMenu()
				if player.inventory[menuPointer] == "Dredge":
					dredge.emit()
					quitMenu()
				if player.inventory[menuPointer] == "Sail":
					sailToggle()
					#dialogueBox.dialogue("Equipped sail!")
					quitMenu()
				if player.inventory[menuPointer] == "Anchor":
					if player.boatMode == true:
						anchorToggle()
					quitMenu()
				else:
					quitMenu()
			else:
				quitMenu()
