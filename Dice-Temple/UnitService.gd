# Unit Service is always parenting all Unit nodes and is child of
# the combat_main node

extends Node2D

@onready var units: Array[Node] = self.get_children() # All children will be units
@onready var game_master: Node = get_parent()
# --TODO-- Change dependencies to support UnitService instead of being passed down


# resolve_attack takes two Unit nodes as parameters, and 
# expects them to have mod_health and get_attack functions
func resolve_attack(target: Node2D, attacker: Node2D, dice: Node2D):
	var hit_value = dice.roll() + attacker.get_attack()
	target.mod_health(-1 * hit_value)
	print("HIYAAA from " + attacker.to_string())
