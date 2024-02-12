extends Node2D

@onready var dice_service: Node2D = $DiceService
@onready var unit_service: Node2D = $UnitService
@onready var roll_display: Control = $UI/HBoxContainer/DieRoll
@onready var health_display: Control = $UI/HBoxContainer/HealthRead

var round_length: int # Each unit under unit_service has an implicit index
var turn: int

func _ready():	
	health_display.text = String.num_int64(unit_service.units[1].get_health())
	turn = 0
	round_length = unit_service.units.size()
	
# Take a turn of combat with the turn variable's selected unit
func take_turn() -> bool:
	# Update the player's state - bad status, fading buffs, on-your-next-turn events
	# Call unit_service for character options
	# Open the turn UI
	unit_service.resolve_attack(unit_service.units[(turn + 1) % round_length], unit_service.units[turn])
	return true # Exit and wait until player signal prompts us to do something

func _on_button_button_down():
	roll_display.text = String.num_int64(dice_service.roll(6))


func _on_turn_end():
	turn = (turn + 1) % round_length
	take_turn()
