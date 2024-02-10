extends Node2D

@export var HEALTH_MAX: int
@export var health: int
@onready var health_display: Control = $ProgressBar

func _ready():
	health_display.max_value = HEALTH_MAX

func _process(delta):
	health_display.value = health
	
func get_health() -> int:
	return health
