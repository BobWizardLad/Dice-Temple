extends Node2D

@export var HEALTH_MAX: int # Maximum health value of the unit.
@export var health: int # Current hitpoints, life, etc.
@export var team: int # Team num will determine who can attack who.

@onready var health_display: Control = $ProgressBar
@onready var attack_handler: Node2D = $AttacksHandler
@onready var sprite: Sprite2D = $Sprite

func _ready():
	health_display.max_value = HEALTH_MAX

func _process(delta):
	health_display.value = health

func get_health() -> int:
	return health

func mod_health(mod: int) -> void:
	health += mod

func get_attack_dice() -> Array:
	return attack_handler.get_dice()

func get_team() -> int:
	return team

func anim_damaged():
	sprite.texture = load("res://assets/sprites/unit_silhouette_damaged.png")
	await get_tree().create_timer(1.0).timeout
	sprite.texture = load("res://assets/sprites/unit_silhouette.png")

func anim_attack():
	sprite.texture = load("res://assets/sprites/unit_silhouette_attacking.png")
	# Signal some form of attack_dice specific animation between characters
	await get_tree().create_timer(1.0).timeout
	sprite.texture = load("res://assets/sprites/unit_silhouette.png")

func anim_attacking():
	pass
