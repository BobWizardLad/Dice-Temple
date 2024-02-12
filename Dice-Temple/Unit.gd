extends Node2D

@export var HEALTH_MAX: int # Maximum health value of the unit.
@export var health: int # Current hitpoints, life, etc.
@export var attack: int # Attack damage
@export var team: int # Team num will determine who can attack who.

@onready var health_display: Control = $ProgressBar

func _ready():
	health_display.max_value = HEALTH_MAX

func _process(delta):
	health_display.value = health

func get_health() -> int:
	return health

func mod_health(mod: int) -> void:
	health += mod

func get_attack() -> int:
	return attack

func get_team() -> int:
	return team
