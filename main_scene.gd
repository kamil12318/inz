extends Node2D

var save_path = "user"

func _process(delta):
		
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
