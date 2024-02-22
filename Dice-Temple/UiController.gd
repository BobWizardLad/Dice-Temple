extends CanvasLayer



func _on_unit_service_on_attack_roll(attack: Node2D):
	$AttackName.text = attack.get_title()
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = true # Show reroll menu


func _on_confirm():
	$TurnHeader.visible = true # Show turn menu
	$AttackHeader.visible = false # Hide reroll menu


func _on_game_service_on_reroll(attack: Node2D, rerolls: int):
	$AttackName.text = attack.get_title()
