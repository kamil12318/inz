extends Control

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	GlobalVar.playerscore = 0


func _on_quit_button_pressed():
	get_tree().quit()
