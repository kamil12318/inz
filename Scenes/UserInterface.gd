extends Control



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GlobalVar.player_hp == 1:
		$HealthBar.set_frame(0)
	elif GlobalVar.player_hp == 2:
		$HealthBar.set_frame(1)
	elif GlobalVar.player_hp == 3:
		$HealthBar.set_frame(2)
	elif GlobalVar.player_hp == 4:
		$HealthBar.set_frame(3)
	elif GlobalVar.player_hp == 5:
		$HealthBar.set_frame(4)
	elif GlobalVar.player_hp == 6:
		$HealthBar.set_frame(5)
	elif GlobalVar.player_hp == 7:
		$HealthBar.set_frame(6)
	elif GlobalVar.player_hp == 8:
		$HealthBar.set_frame(7)
	elif GlobalVar.player_hp == 9:
		$HealthBar.set_frame(8)
	elif GlobalVar.player_hp == 10:
		$HealthBar.set_frame(9)
	
	if GlobalVar.base_hp == 3:
		$baseHP.set_frame(0)
	elif GlobalVar.base_hp == 2:
		$baseHP.set_frame(1)
	elif GlobalVar.base_hp == 1:
		$baseHP.set_frame(2)

