extends Node2D

@onready var dice_service: Node2D = $DiceService
@onready var roll_display: Control = $UI/Label

func _ready():
	pass

func _on_button_button_down():
	roll_display.text = String.num_int64(dice_service.roll(6))
