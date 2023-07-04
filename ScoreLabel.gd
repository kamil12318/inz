extends Label



func _physics_process(delta):
	
	text = "Score: " + str(GlobalVar.playerscore) + "\n Speed: " + str(GlobalVar.spawntimer)

