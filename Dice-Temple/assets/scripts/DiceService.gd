extends Node2D

var random: RandomNumberGenerator;

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

# Returns a number from 0 to 5
func roll() -> int:
	return random.randi_range(0, 5)

# Takes the #num of die faces and returns the roll starting at zero
# ex. a d6 can roll from 0 to 5
func roll_size(size: int) -> int:
	return random.randi_range(0, size - 1)
