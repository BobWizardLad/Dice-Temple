extends CanvasLayer

func _on_unit_service_on_attack_roll(attack: Node2D):
	$AttackDisplay.visible = true
	$AttackDisplay/AttackName.text = attack.get_title()
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = true # Show reroll menu
	$RerollCounter.visible = true
	$RerollCounter/Rerolls.text = String.num_int64(3)

func _on_confirm():
	$TurnHeader.visible = true # Show turn menu
	$AttackHeader.visible = false # Hide reroll menu
	$AttackDisplay.visible = false # Hide Attack Display
	$TurnHeader/ButtonContainer/Attack.modulate = Color(1, 1, 1, 0.33)
	$AttackHeader/ButtonContainer/Reroll.modulate = Color(1, 1, 1, 1)
	$RerollCounter.visible = false

func _on_game_service_on_reroll(attack: Node2D, rerolls: int):
	$AttackDisplay/AttackName.text = attack.get_title()
	$RerollCounter/Rerolls.text = String.num_int64(rerolls)
	if rerolls == 0:
		$AttackHeader/ButtonContainer/Reroll.modulate = Color(1, 1, 1, 0.33)

func _on_turn_end_button_down():
	$TurnHeader/ButtonContainer/Attack.modulate = Color(1, 1, 1, 1)

func _on_game_service_game_win():
	$GameEnd.visible = true
	$GameEnd/WinMessage.visible = true
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = false # Hide reroll menu

func _on_game_service_game_over():
	$GameEnd.visible = true
	$GameEnd/LoseMessage.visible = true
	$TurnHeader.visible = false # Hide turn menu
	$AttackHeader.visible = false # Hide reroll menu
