extends TileMapLayer
var positionStore
var xDiff
var yDiff

func _ready() -> void:
	positionStore = global_position
	
func _physics_process(delta: float) -> void:
#	incorrect but passable-ish for now
	if %Player.boatMode == false and $WanderingEntryCheck.playerHere == true:
		xDiff = global_position.x-positionStore.x
		yDiff = global_position.y-positionStore.y		
		%Player.position.x += xDiff
		%Player.position.y += yDiff
		
	if %Player.boatMode == true and $WanderingEntryCheck.playerHere == true:
		xDiff = global_position.x-positionStore.x
		yDiff = global_position.y-positionStore.y		
		%Boat.position.x += xDiff
		%Boat.position.y += yDiff
		
	positionStore = global_position
