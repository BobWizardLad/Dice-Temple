extends Node2D

var game_scene = load("res://CombatScene.tscn")
var menu_scene = load("res://MainMenu.tscn")

func _on_start():
	get_child(0).queue_free()
	add_child(game_scene.instantiate())
func _on_exit():
	get_tree().quit()
