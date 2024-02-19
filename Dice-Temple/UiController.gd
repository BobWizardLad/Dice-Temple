extends CanvasLayer



func _on_unit_service_on_attack_roll(attack: Node2D):
	$AttackName.text = attack.get_title()
