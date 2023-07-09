extends Node2D

const SAVE_PATH := "res://test/score.json"


func _process(delta):
	if Input.is_action_just_pressed("save"):
		save_json()
	

func save_json() -> void:
	var data := {
		"playerscore": GlobalVar.playerscore,
		"highscore": GlobalVar.highscore,
		"playerpositionx" : GlobalVar.playerpositionx,
		"playerpositiony" :GlobalVar.playerpositiony,
	}
	var json_data := JSON.stringify(data)
	var file_access := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file_access.store_line(json_data)
	file_access.close()


func load_json() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file_access := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_data := file_access.get_line()
	file_access.close()
	var data: Dictionary = JSON.parse_string(json_data)
	GlobalVar.playerscore = data.playerscore
	GlobalVar.highscore = data.highscore
	

