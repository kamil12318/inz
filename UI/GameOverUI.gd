extends Control

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://main_scene.tscn")
	GlobalVar.playerscore = 0

func _on_quit_button_pressed():
	get_tree().quit()
	
func _process(delta):
	
		if Input.is_action_just_pressed("exit"):
			get_tree().quit()
	

