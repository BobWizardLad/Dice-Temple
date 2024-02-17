# Unit Service is always parenting all Unit nodes and is child of
# the GameService node

extends Node2D

@onready var dice_service: Node2D = $"../DiceService"

@onready var units: Array[Node] = self.get_children() # All children will be units
@onready var game_master: Node = get_parent()

# resolve_attack takes two Unit nodes as parameters, and 
# expects them to have mod_health and get_attack functions
# target: Unit; attacker: Unit
func resolve_attack(target: Node2D, attacker: Node2D):
	var hit_value = roll_event(attacker)
	target.mod_health(-1 * hit_value)
	print("HIYAAA from " + attacker.to_string())

# All actions that are taken when a dice roll occours
func roll_event(attacker: Node2D) -> int:
	return attacker.get_attack_dice()[dice_service.roll() - 1].get_damage()
