extends Node2D

var random: RandomNumberGenerator;

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

func roll(size: int) -> int:
	return random.randi_range(1, size)
