extends Control

var saver = load("res://Scripts/Saver.gd").new()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_contiune_button_pressed():
	saver.load_json()
	GlobalVar.onload = 1
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
