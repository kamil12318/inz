extends Control

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	GlobalVar.playerscore = 0

func _on_quit_button_pressed():
	get_tree().quit()
	
func _process(delta):
	
		if Input.is_action_just_pressed("exit"):
			get_tree().quit()
	

