extends Node2D

func _on_area_2d_area_entered(_area):
	if GlobalVar.player_hp <= 8:
		GlobalVar.player_hp += 2
	else:
		GlobalVar.player_hp = 10
	queue_free()
	print(GlobalVar.player_hp)
