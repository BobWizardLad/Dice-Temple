extends Node2D

@onready var unit_service: Node2D = $UnitService
@onready var dice_service: Node2D = $DiceService

var my_scene: Resource = load("res://CombatScene.tscn")

signal on_attack_roll # Signals the UI to display the attack choice
signal on_confirm # Signal UI to change back to menu
signal on_reroll # Signal UI to show new dice face
signal game_win # Signal UI for Game Win
signal game_over # Signal UI for Game Over

var round_length: int # Each unit under unit_service has an implicit index.
var turn: int # The current turn index - who's turn is it?
var is_player_active: bool # is it the player's turn?
var has_attacked: bool # Current unit's turn has atacked.
var held_attack # persistent attack choice held for the PLAYER.

func _ready():
	turn = 0
	round_length = unit_service.units.size()
	has_attacked = false
	
	if turn == 0:
		is_player_active = true
		take_player_turn()
	else:
		take_npc_turn()

func _process(delta):
	if unit_service.units[0].get_health() == 0:
		emit_signal("game_over")
	if unit_service.units[1].get_health() == 0:
		emit_signal("game_win")

#------------------------------------- Turn System -------------------------------------

# Player takes a turn of combat, called when turn end resolves to player's turn
func take_player_turn() -> bool:
	if turn == 0:
		is_player_active = true
		
	return true # Exit and wait until player signal prompts us to do something

# Player takes a turn of combat, called when turn end resolves to non-player's turn
func take_npc_turn() -> bool:
	
	# Enemy autoresolves to attack player (always index 0)
	unit_service.resolve_attack(unit_service.units[0], unit_service.units[1], unit_service.units[1].get_attack_dice()[dice_service.roll()])
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
# Roll the dice to present to the player.
func _on_attack():
	if not has_attacked:
		held_attack = unit_service.units[0].get_attack_dice()[dice_service.roll()]
		emit_signal("on_attack_roll", held_attack)
	else:
		pass # --TODO-- Give user feedback

func _on_reroll():
		held_attack = unit_service.units[0].get_attack_dice()[dice_service.roll()]
		emit_signal("on_reroll", held_attack, 3)

func _on_confirm():
	unit_service.resolve_attack(unit_service.units[1], unit_service.units[0], held_attack)
	has_attacked = true
	held_attack = null
	emit_signal("on_attack_roll", get_node("BlankAttack"))
	emit_signal("on_confirm")

func _on_game_end():
	get_tree().quit()

func _on_end_game_button_down():
	get_tree().reload_current_scene()
