extends Node2D

var game_scene = load("res://CombatScene.tscn")
var menu_scene = load("res://MainMenu.tscn")

func _on_start_button_down():
	get_child(0).queue_free()
	add_child(game_scene.instantiate())
func _on_exit_button_down():
	get_tree().quit()
