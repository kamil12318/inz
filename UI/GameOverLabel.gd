extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#text = "GameOver \nHighScore: %s \n " % GlobalVar.highscore % "CurrentScore: %s " % GlobalVar.playerscore
	
func _physics_process(delta):
	text = "GameOver \nHighScore: " + str(GlobalVar.highscore) + "\nCurrentScore: " + str(GlobalVar.playerscore)
