extends CanvasLayer



func _on_unit_service_on_attack_roll(attack: Node2D):
	print("Sanity B")
	$AttackName.text = attack.get_title()
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = true # Show reroll menu
