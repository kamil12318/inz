extends Label

func _physics_process(_delta):
	
	text = "HP: " + str(GlobalVar.player_hp)
