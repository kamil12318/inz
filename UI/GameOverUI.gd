extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(GlobalVar.highscore)
	print(GlobalVar.playerscore)


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
