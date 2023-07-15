extends Label

func _physics_process(_delta):
	text = "GameOver \nHighScore: " + str(GlobalVar.highscore) + "\nCurrentScore: " + str(GlobalVar.playerscore)
