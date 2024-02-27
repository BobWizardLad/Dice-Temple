extends CanvasLayer

func _on_unit_service_on_attack_roll(attack: Node2D):
	$AttackName.text = attack.get_title()
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = true # Show reroll menu

func _on_confirm():
	$TurnHeader.visible = true # Show turn menu
	$AttackHeader.visible = false # Hide reroll menu
	$TurnHeader/Attack.modulate = Color(1, 1, 1, 0.33)
	$AttackHeader/Reroll.modulate = Color(1, 1, 1, 1)

func _on_game_service_on_reroll(attack: Node2D, rerolls: int):
	$AttackName.text = attack.get_title()
	$Rerolls.text = String.num_int64(rerolls)
	if rerolls == 0:
		$AttackHeader/Reroll.modulate = Color(1, 1, 1, 0.33)

func _on_turn_end_button_down():
	$TurnHeader/Attack.modulate = Color(1, 1, 1, 1)

func _on_game_service_game_win():
	$GameEnd.visible = true
	$GameEnd/WinMessage.visible = true

func _on_game_service_game_over():
	$GameEnd.visible = true
	$GameEnd/LoseMessage.visible = true
