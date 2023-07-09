extends Control

var saver = load("res://Saver.gd").new()

func _ready():
	pass



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_option_button_pressed():
	saver.load_json()
	GlobalVar.onload = 1


func _on_load_button_pressed():
	pass # Replace with function body.
