extends Node2D

@onready var dice_service: Node2D = $DiceService
@onready var player: Node2D = $UnitService/Player
@onready var roll_display: Control = $UI/HBoxContainer/DieRoll
@onready var health_display: Control = $UI/HBoxContainer/HealthRead

func _ready():
	health_display.text = String.num_int64(player.get_health())

func _on_button_button_down():
	roll_display.text = String.num_int64(dice_service.roll(6))
