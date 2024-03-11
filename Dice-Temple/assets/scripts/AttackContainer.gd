extends Node2D

@export var attack_unique: Resource

func get_attack_unique():
	return attack_unique

func set_attack_unique(attack: Resource):
	attack_unique = attack

func get_title() -> String:
	return attack_unique.title

func get_damage() -> int:
	return attack_unique.damage

func get_healing() -> int:
	return attack_unique.healing

func get_blocking() -> int:
	return attack_unique.blocking

func get_attack_frames():
	return attack_unique.attack_texture
