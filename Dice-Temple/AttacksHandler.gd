extends Node2D

# Hold a dice object that holds all the attacks in a list.
# Make it exportable and manange children as attacks.

var attack_dice: Array

func _ready():
	build_dice()
	
# Build the dice as an array from child nodes
func build_dice():
	attack_dice = Array()
	for each in get_children():
		attack_dice.append(each)
