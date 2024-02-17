extends Node2D

@onready var unit_service: Node2D = $UnitService

var round_length: int # Each unit under unit_service has an implicit index
var turn: int # The current turn index - who's turn is it?
var is_player_active: bool # is it the player's turn?
var has_attacked: bool # Current unit's turn has atacked

func _ready():	
	turn = 0
	round_length = unit_service.units.size()
	has_attacked = false
	
	if turn == 0:
		is_player_active = true
		take_player_turn()
	else:
		take_npc_turn()

#------------------------------------- Turn System -------------------------------------

# Player takes a turn of combat, called when turn end resolves to player's turn
func take_player_turn() -> bool:
	if turn == 0:
		is_player_active = true
		
	return true # Exit and wait until player signal prompts us to do something

# Player takes a turn of combat, called when turn end resolves to non-player's turn
func take_npc_turn() -> bool:
	
	# Enemy autoresolves to attack player (always index 0)
	unit_service.resolve_attack(unit_service.units[0], unit_service.units[1])
	_on_turn_end()
	
	return true # Exit and wait until player signal prompts us to do something

# Call when the end turn button is pressed, this will deactivate the player
# and increment the turn order.
func _on_turn_end():
	if is_player_active:
		turn = (turn + 1) % round_length
		has_attacked = false
		if turn == 0:
			is_player_active = false
			take_player_turn()
		else:
			take_npc_turn()

# Called when player presses the attack button.
func _on_attack():
	if not has_attacked:
		unit_service.resolve_attack(unit_service.units[1], unit_service.units[0])
		has_attacked = true
	else:
		pass # --TODO-- Give user feedback