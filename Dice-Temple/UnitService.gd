extends Node2D

@onready var units: Array[Node] = self.get_children() # All children will be units

func _ready():
	pass

func _process(delta):
	pass

# resolve_attack takes two Unit nodes as parameters, and 
# expects them to have mod_health and get_attack functions
func resolve_attack(target: Node2D, attacker: Node2D):
	target.mod_health(-1 * attacker.get_attack())

func _on_attack_button_down():
	resolve_attack(units[0], units[1])
