extends CanvasLayer

@onready var player = get_node("/root/Node2D/Player")
var menuItems = ["Inventory", "Continue"]
var menuPointer = 1
var subMenu = null

func _on_player_menu_start() -> void:
	self.visible = true
	var ticker = 1
	for i in menuItems:
		var menuItem = Label.new()
		menuItem.position.x = 0
		menuItem.position.y = -20+ticker*20
		$Panel.add_child(menuItem)
		menuItem.text = i
		menuItem.name = str(ticker)
		ticker += 1
	var target = $Panel.get_node(str(menuPointer))
	$Panel/MenuPointer.reparent(target)

#WIP: next make the MenuPointer sprite follow the parented node based on
# 		menuPointer (maybe improve the naming here...) and then some system to
#		move to sub-menus

func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		menuPointer +=1

	if Input.is_action_just_pressed("up"):
		menuPointer -= 1
				
	if Input.is_action_just_pressed("menuConfirm"):
		if menuItems[menuPointer] == "Inventory":
			pass
	if Input.is_action_just_pressed("menuEsc"):
		visible = false
		player.menuMode = false
