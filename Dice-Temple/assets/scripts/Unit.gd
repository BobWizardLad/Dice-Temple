extends Node2D

@export var HEALTH_MAX: int # Maximum health value of the unit.
@export var health: int # Current hitpoints, life, etc.
@export var team: int # Team num will determine who can attack who.

signal attack_action # Signals visuals for the attack action

@onready var health_display: Control = $HealthBar
@onready var attack_handler: Node2D = $AttacksHandler
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready():
	health_display.max_value = HEALTH_MAX

func _process(delta):
	health_display.value = health

func get_health() -> int:
	return health

func get_health_max() -> int:
	return HEALTH_MAX

func set_health(value: int):
	health = value

func mod_health(mod: int) -> void:
	health += mod

func get_attack_dice() -> Array:
	return attack_handler.get_dice()

func get_team() -> int:
	return team
