# Unit Service is always parenting all Unit nodes and is child of
# the GameService node

extends Node2D

@onready var units: Array[Node] = self.get_children() # All children will be units
@onready var game_master: Node = get_parent()

# resolve_attack takes two Unit nodes as parameters, and 
# expects them to have mod_health and get_attack functions
# target: Unit; attacker: Unit
func resolve_attack(target: Node2D, attacker: Node2D, attack: Node2D):
	var hit_value = attack.get_damage()
	var healing = attack.get_healing()
	
	target.mod_health(-1 * hit_value)
	attacker.mod_health(healing)
	
	if attacker.get_health() > attacker.get_health_max():
		attacker.set_health(attacker.get_health_max())
	if target.get_health() > target.get_health_max():
		target.set_health(target.get_health_max())
	if attacker.get_health() < 0:
		attacker.set_health(0)
	if target.get_health() < 0:
		target.set_health(0)
	
	print("HIYAAA from " + attacker.to_string())
