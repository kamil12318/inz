extends Label

func _physics_process(delta):
	
	text = "HP: " + str(GlobalVar.player_hp)
